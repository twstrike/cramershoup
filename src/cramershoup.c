/* -*- mode: c; c-file-style: "openbsd" -*- */
/*
 * Copyright (c) 2017 ThoughtWorks <strike-public@thoughtworks.com>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "cramershoup.h"

#include <stdio.h>
#include <string.h>
#include <libdecaf/decaf_crypto.h>
#include "randombytes.h"

void
find_g2(decaf_448_point_t p)
{
    unsigned char encoded_scalar[DECAF_448_SCALAR_BYTES+8];
    const char *magic = "otrv4_g2";
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, (const unsigned char *)magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_t scalar;
    decaf_bool_t valid = decaf_448_scalar_decode(scalar, encoded_scalar);
    decaf_bzero(encoded_scalar, sizeof(encoded_scalar));
    if (!valid){
        fatal("find_g2", "encoded_scalar decode failure\n");
    }

    decaf_448_precomputed_scalarmul(p, decaf_448_precomputed_base, scalar);
}

void random_scalar(decaf_448_scalar_t secret_scalar)
{
    decaf_448_symmetric_key_t proto;
    randombytes(proto,sizeof(proto));

    const char *magic = "cramershoup_secret";
    uint8_t encoded_scalar[DECAF_448_SCALAR_BYTES+8];

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, proto, sizeof(decaf_448_symmetric_key_t));
    shake256_update(sponge, (const unsigned char *)magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_decode_long(secret_scalar, encoded_scalar, sizeof(encoded_scalar));
    decaf_bzero(encoded_scalar, sizeof(encoded_scalar));
}

void
shake256_update_decaf_point(keccak_sponge_t sponge, decaf_448_point_t p)
{
    unsigned char *pp = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    decaf_448_point_encode(pp, p);
    shake256_update(sponge, (const unsigned char *)pp, DECAF_448_SER_BYTES);
}

void
shake256_update_decaf_scalar(keccak_sponge_t sponge, decaf_448_scalar_t p)
{
    unsigned char *pp = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    decaf_448_scalar_encode(pp, p);
    shake256_update(sponge, (const unsigned char *)pp, DECAF_448_SCALAR_BYTES);
}

void
shake256_final_decaf_scalar(keccak_sponge_t sponge, decaf_448_scalar_t p)
{
    uint8_t pp[DECAF_448_SCALAR_BYTES];
    shake256_final(sponge, pp, sizeof(pp));
    decaf_448_scalar_decode_long(p, pp, sizeof(pp));
    decaf_bzero(pp, sizeof(pp));
}

void
cramershoup_448_derive_keys(
        cramershoup_448_private_key_t *priv,
        cramershoup_448_public_key_t *pub)
{
    decaf_448_point_t g1, g2;
    decaf_448_point_copy(g1, decaf_448_point_base);
    find_g2(g2);

    //Private key
    random_scalar(priv->x1);
    random_scalar(priv->x2);
    random_scalar(priv->y1);
    random_scalar(priv->y2);
    random_scalar(priv->z);

    //Public key
    decaf_448_point_double_scalarmul(pub->c, g1, priv->x1, g2, priv->x2);
    decaf_448_point_double_scalarmul(pub->d, g1, priv->y1, g2, priv->y2);
    decaf_448_point_scalarmul(pub->h, g1, priv->z);
}

void
cramershoup_448_enc(unsigned char *ciphertext, const unsigned char *plaintext, cramershoup_448_public_key_t *pub)
{
    decaf_448_point_t g1, g2;
    decaf_448_point_copy(g1, decaf_448_point_base);
    find_g2(g2);

    decaf_448_scalar_t k, a;
    decaf_448_point_t u1, u2, m, e;
    random_scalar(k);
    //u1 = G1*k, u2 = G2*k
    decaf_448_point_scalarmul(u1,g1,k);
    decaf_448_point_scalarmul(u2,g2,k);
    //e = (h*k) + m
    decaf_bool_t valid = decaf_448_point_decode(m, plaintext, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_enc", "m decode failure\n");
    }
    decaf_448_point_scalarmul(e,pub->h,k);
    decaf_448_point_add(e,e,m);

    //α = H(u1,u2,e)
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update_decaf_point(sponge, u1);
    shake256_update_decaf_point(sponge, u2);
    shake256_update_decaf_point(sponge, e);
    shake256_final_decaf_scalar(sponge, a);
    shake256_destroy(sponge);

    // v = c*k + d*(k * α)
    decaf_448_point_t ck, dka, v;
    decaf_448_point_scalarmul(ck,pub->c,k);
    decaf_448_point_scalarmul(dka,pub->d,k);
    decaf_448_point_scalarmul(dka,dka,a);
    decaf_448_point_add(v,ck,dka);
    //TODO: forget ck, dka

    decaf_448_point_encode(ciphertext,u1);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES,u2);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*2,e);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*3,v);
}

void
cramershoup_448_dec(unsigned char *plaintext, const unsigned char *ciphertext, cramershoup_448_private_key_t *priv)
{
    decaf_448_point_t u1, u2, e, v;
    decaf_bool_t valid = decaf_448_point_decode(u1, ciphertext, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u1 decode failure\n");
    }
    valid = decaf_448_point_decode(u2, ciphertext+DECAF_448_SER_BYTES, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u2 decode failure\n");
    }
    valid = decaf_448_point_decode(e, ciphertext+DECAF_448_SER_BYTES*2, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "e decode failure\n");
    }
    valid = decaf_448_point_decode(v, ciphertext+DECAF_448_SER_BYTES*3, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "v decode failure\n");
    }

    //Verify v
    //α = H(u1,u2,e)
    decaf_448_scalar_t a;
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, (const unsigned char *)ciphertext, DECAF_448_SER_BYTES*3);
    shake256_final_decaf_scalar(sponge, a);
    shake256_destroy(sponge);

    //check (u1*x1+u2*x2)+(u1*y1+u2*y2)*α == v
    decaf_448_point_t vv, u1x1u2x2, u1y1u2y2;
    decaf_448_point_double_scalarmul(u1x1u2x2, u1, priv->x1, u2, priv->x2);
    decaf_448_point_double_scalarmul(u1y1u2y2, u1, priv->y1, u2, priv->y2);
    decaf_448_point_scalarmul(vv,u1y1u2y2,a);
    decaf_448_point_add(vv,u1x1u2x2,vv);
    valid = decaf_448_point_eq(vv,v);
    if (!valid){
        fatal("cramershoup_dec", "v verify failure\n");
    }

    //Decrypt m = e - u1*z
    decaf_448_point_t m;
    decaf_448_point_scalarmul(m,u1,priv->z);
    decaf_448_point_sub(m,e,m);
    decaf_448_point_encode(plaintext, m);
}


void
dr_cramershoup_448_enc(
        unsigned char *ciphertext,
        const unsigned char *plaintext,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2)
{
    decaf_448_point_t g1, g2;
    decaf_448_point_copy(g1, decaf_448_point_base);
    find_g2(g2);

    decaf_448_scalar_t k1, k2, a1, a2;
    decaf_448_point_t m;
    decaf_448_point_t u11, u21, e1;
    decaf_448_point_t u12, u22, e2;
    random_scalar(k1);
    random_scalar(k2);
    //u1 = G1*k, u2 = G2*k
    decaf_448_point_scalarmul(u11,g1,k1);
    decaf_448_point_scalarmul(u21,g2,k1);
    decaf_448_point_scalarmul(u12,g1,k2);
    decaf_448_point_scalarmul(u22,g2,k2);
    //e = (h*k) + m
    decaf_bool_t valid = decaf_448_point_decode(m, plaintext, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_enc", "m decode failure\n");
    }
    decaf_448_point_scalarmul(e1,pub1->h,k1);
    decaf_448_point_add(e1,e1,m);
    decaf_448_point_scalarmul(e2,pub2->h,k2);
    decaf_448_point_add(e2,e2,m);

    //α = H(u1,u2,e)
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update_decaf_point(sponge,u11);
    shake256_update_decaf_point(sponge,u21);
    shake256_update_decaf_point(sponge,e1);
    shake256_final_decaf_scalar(sponge, a1);

    shake256_init(sponge);
    shake256_update_decaf_point(sponge,u12);
    shake256_update_decaf_point(sponge,u22);
    shake256_update_decaf_point(sponge,e2);
    shake256_final_decaf_scalar(sponge, a2);

    // v = c*k + d*(k * α)
    decaf_448_point_t ck1, dka1, v1;
    decaf_448_point_scalarmul(ck1,pub1->c,k1);
    decaf_448_point_scalarmul(dka1,pub1->d,k1);
    decaf_448_point_scalarmul(dka1,dka1,a1);
    decaf_448_point_add(v1,ck1,dka1);
    //TODO: forget ck1, dka1

    decaf_448_point_t ck2, dka2, v2;
    decaf_448_point_scalarmul(ck2,pub2->c,k2);
    decaf_448_point_scalarmul(dka2,pub2->d,k2);
    decaf_448_point_scalarmul(dka2,dka2,a2);
    decaf_448_point_add(v2,ck2,dka2);
    //TODO: forget ck2, dka2

    // NIZKPK
    // T1= g1^t T2=g2^t T3=(c * d^a)t
    // T4= h1^t1 / h2^t2
    decaf_448_point_t t11, t21, t31;
    decaf_448_point_t t12, t22, t32;
    decaf_448_point_t t4;
    decaf_448_scalar_t t1, t2;
    random_scalar(t1);
    random_scalar(t2);

    decaf_448_point_scalarmul(t11,g1,t1);
    decaf_448_point_scalarmul(t21,g2,t1);
    decaf_448_point_scalarmul(t31,pub1->d,a1);
    decaf_448_point_add(t31,pub1->c,t31);
    decaf_448_point_scalarmul(t31,t31,t1);

    decaf_448_point_scalarmul(t12,g1,t2);
    decaf_448_point_scalarmul(t22,g2,t2);
    decaf_448_point_scalarmul(t32,pub2->d,a2);
    decaf_448_point_add(t32,pub2->c,t32);
    decaf_448_point_scalarmul(t32,t32,t2);

    decaf_448_point_t h2t2;
    decaf_448_point_scalarmul(t4,pub1->h,t1);
    decaf_448_point_scalarmul(h2t2,pub2->h,t2);
    decaf_448_point_sub(t4,t4,h2t2);
    //TODO: forget h2t2

    decaf_448_scalar_t l, n1, n2;
    // l=H(gv||pv||ev||zv)
    shake256_init(sponge);
    // shake256_update(sponge,gv);
    shake256_update_decaf_point(sponge,g1);
    shake256_update_decaf_point(sponge,g2);
    //TODO: shake256_update_decaf_scalar(decaf_448_scalar_p);
    // shake256_update(sponge,pv);
    shake256_update_decaf_point(sponge,pub1->c);
    shake256_update_decaf_point(sponge,pub1->d);
    shake256_update_decaf_point(sponge,pub1->h);
    shake256_update_decaf_point(sponge,pub2->c);
    shake256_update_decaf_point(sponge,pub2->d);
    shake256_update_decaf_point(sponge,pub2->h);
    // shake256_update(sponge,ev);
    shake256_update_decaf_point(sponge,u11);
    shake256_update_decaf_point(sponge,u21);
    shake256_update_decaf_point(sponge,e1);
    shake256_update_decaf_point(sponge,v1);
    shake256_update_decaf_scalar(sponge,a1);
    shake256_update_decaf_point(sponge,u12);
    shake256_update_decaf_point(sponge,u22);
    shake256_update_decaf_point(sponge,e2);
    shake256_update_decaf_point(sponge,v2);
    shake256_update_decaf_scalar(sponge,a2);
    // shake256_update(sponge,zv);
    shake256_update_decaf_point(sponge,t11);
    shake256_update_decaf_point(sponge,t21);
    shake256_update_decaf_point(sponge,t31);
    shake256_update_decaf_point(sponge,t12);
    shake256_update_decaf_point(sponge,t22);
    shake256_update_decaf_point(sponge,t32);
    shake256_update_decaf_point(sponge,t4);
    shake256_final_decaf_scalar(sponge, l);
    shake256_destroy(sponge);
    // n=t-l*k
    decaf_448_scalar_mul(n1,l,k1);
    decaf_448_scalar_sub(n1,t1,n1);
    decaf_448_scalar_mul(n2,l,k2);
    decaf_448_scalar_sub(n2,t2,n2);

    decaf_448_point_encode(ciphertext,u11);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES,u21);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*2,e1);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*3,v1);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*4,u12);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*5,u22);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*6,e2);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*7,v2);
    decaf_448_scalar_encode(ciphertext+DECAF_448_SCALAR_BYTES*8,l);
    decaf_448_scalar_encode(ciphertext+DECAF_448_SCALAR_BYTES*9,n1);
    decaf_448_scalar_encode(ciphertext+DECAF_448_SCALAR_BYTES*10,n2);
}

void
dr_cramershoup_448_dec(
        unsigned char *plaintext,
        const unsigned char *ciphertext,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2,
        cramershoup_448_private_key_t *priv,
        int index)
{
    decaf_448_point_t g1, g2;
    decaf_448_point_copy(g1, decaf_448_point_base);
    find_g2(g2);

    decaf_448_point_t u11, u21, e1, v1, u12, u22, e2, v2;
    decaf_448_scalar_t l, n1, n2;
    decaf_bool_t valid;
    valid = decaf_448_point_decode(u11, ciphertext, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u11 decode failure\n");
    }
    valid = decaf_448_point_decode(u21, ciphertext+DECAF_448_SER_BYTES, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u21 decode failure\n");
    }
    valid = decaf_448_point_decode(e1, ciphertext+DECAF_448_SER_BYTES*2, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "e1 decode failure\n");
    }
    valid = decaf_448_point_decode(v1, ciphertext+DECAF_448_SER_BYTES*3, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "v1 decode failure\n");
    }
    valid = decaf_448_point_decode(u12, ciphertext+DECAF_448_SER_BYTES*4, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u12 decode failure\n");
    }
    valid = decaf_448_point_decode(u22, ciphertext+DECAF_448_SER_BYTES*5, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u22 decode failure\n");
    }
    valid = decaf_448_point_decode(e2, ciphertext+DECAF_448_SER_BYTES*6, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "e2 decode failure\n");
    }
    valid = decaf_448_point_decode(v2, ciphertext+DECAF_448_SER_BYTES*7, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "v2 decode failure\n");
    }
    valid = decaf_448_scalar_decode(l, ciphertext+DECAF_448_SER_BYTES*8);
    if (!valid){
        fatal("cramershoup_dec", "l decode failure\n");
    }
    valid = decaf_448_scalar_decode(n1, ciphertext+DECAF_448_SER_BYTES*9);
    if (!valid){
        fatal("cramershoup_dec", "n1 decode failure\n");
    }
    valid = decaf_448_scalar_decode(n2, ciphertext+DECAF_448_SER_BYTES*10);
    if (!valid){
        fatal("cramershoup_dec", "n2 decode failure\n");
    }

    decaf_448_scalar_t a1, a2;
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update_decaf_point(sponge,u11);
    shake256_update_decaf_point(sponge,u21);
    shake256_update_decaf_point(sponge,e1);
    shake256_final_decaf_scalar(sponge, a1);

    shake256_init(sponge);
    shake256_update_decaf_point(sponge,u12);
    shake256_update_decaf_point(sponge,u22);
    shake256_update_decaf_point(sponge,e2);
    shake256_final_decaf_scalar(sponge, a2);

    decaf_448_point_t t11, t21, t31;
    decaf_448_point_t t12, t22, t32;
    decaf_448_point_t t4;

    decaf_448_point_double_scalarmul(t11, g1, n1, u11, l);
    decaf_448_point_double_scalarmul(t21, g2, n1, u21, l);
    decaf_448_point_scalarmul(t31, pub1->d, a1);
    decaf_448_point_add(t31, pub1->c, t31);
    decaf_448_point_double_scalarmul(t31, t31, n1, v1, l);

    decaf_448_point_double_scalarmul(t12, g1, n2, u12, l);
    decaf_448_point_double_scalarmul(t22, g2, n2, u22, l);
    decaf_448_point_scalarmul(t32, pub2->d, a2);
    decaf_448_point_add(t32, pub2->c, t32);
    decaf_448_point_double_scalarmul(t32, t32, n2, v2, l);

    decaf_448_point_t h1n1_h2n2, h2n2;

    decaf_448_point_scalarmul(h1n1_h2n2, pub1->h, n1);
    decaf_448_point_scalarmul(h2n2, pub2->h, n2);
    decaf_448_point_sub(h1n1_h2n2, h1n1_h2n2, h2n2);
    decaf_448_point_sub(t4, e1, e2);
    decaf_448_point_scalarmul(t4, t4, l);
    decaf_448_point_add(t4, h1n1_h2n2, t4);
    //TODO: forget h1n1_h2n2,h2n2

    // l'=H(gv||pv||ev||zv)
    decaf_448_scalar_t ll;
    shake256_init(sponge);
    // shake256_update(sponge,gv);
    shake256_update_decaf_point(sponge,g1);
    shake256_update_decaf_point(sponge,g2);
    //TODO: shake256_update_decaf_scalar(decaf_448_scalar_p);
    // shake256_update(sponge,pv);
    shake256_update_decaf_point(sponge,pub1->c);
    shake256_update_decaf_point(sponge,pub1->d);
    shake256_update_decaf_point(sponge,pub1->h);
    shake256_update_decaf_point(sponge,pub2->c);
    shake256_update_decaf_point(sponge,pub2->d);
    shake256_update_decaf_point(sponge,pub2->h);
    // shake256_update(sponge,ev);
    shake256_update_decaf_point(sponge,u11);
    shake256_update_decaf_point(sponge,u21);
    shake256_update_decaf_point(sponge,e1);
    shake256_update_decaf_point(sponge,v1);
    shake256_update_decaf_scalar(sponge,a1);
    shake256_update_decaf_point(sponge,u12);
    shake256_update_decaf_point(sponge,u22);
    shake256_update_decaf_point(sponge,e2);
    shake256_update_decaf_point(sponge,v2);
    shake256_update_decaf_scalar(sponge,a2);
    // shake256_update(sponge,zv);
    shake256_update_decaf_point(sponge,t11);
    shake256_update_decaf_point(sponge,t21);
    shake256_update_decaf_point(sponge,t31);
    shake256_update_decaf_point(sponge,t12);
    shake256_update_decaf_point(sponge,t22);
    shake256_update_decaf_point(sponge,t32);
    shake256_update_decaf_point(sponge,t4);
    shake256_final_decaf_scalar(sponge, ll);
    shake256_destroy(sponge);

    decaf_bool_t equal = decaf_448_scalar_eq(l,ll);
    if(!equal){
        fatal("cramershoup_dec", "l verify failure\n");
    }

    decaf_448_point_t u1u2, u3u4;
    if(index == 1){
        decaf_448_point_double_scalarmul(u1u2, u11, priv->x1, u21, priv->x2);
        decaf_448_point_double_scalarmul(u3u4, u11, priv->y1, u21, priv->y2);
        decaf_448_point_scalarmul(u3u4, u3u4, a1);
        decaf_448_point_add(u3u4, u1u2, u3u4);
        equal = decaf_448_point_eq(u3u4, v1);
    } else {
        decaf_448_point_double_scalarmul(u1u2, u12, priv->x1, u22, priv->x2);
        decaf_448_point_double_scalarmul(u3u4, u12, priv->y1, u22, priv->y2);
        decaf_448_point_scalarmul(u3u4, u3u4, a2);
        decaf_448_point_add(u3u4, u1u2, u3u4);
        equal = decaf_448_point_eq(u3u4, v2);
    }
    if(!equal){
        fatal("cramershoup_dec", "v verify failure\n");
    }

    decaf_448_point_t k;
    if(index == 1){
        decaf_448_point_scalarmul(k, u11, priv->z);
        decaf_448_point_sub(k, e1, k);
    } else {
        decaf_448_point_scalarmul(k, u12, priv->z);
        decaf_448_point_sub(k, e2, k);
    }
    decaf_448_point_encode(plaintext, k);
}
