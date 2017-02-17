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
#include <errno.h>
#include <string.h>
#include <libdecaf/decaf_crypto.h>
#include "random.h"

#define WBITS DECAF_WORD_BITS

#if WBITS == 64
#define LBITS 56
typedef __int128_t decaf_sdword_t;
#define LIMB(x) (x##ull)
#define SC_LIMB(x) (x##ull)
#elif WBITS == 32
typedef int64_t decaf_sdword_t;
#define LBITS 28
#define LIMB(x) (x##ull)&((1ull<<LBITS)-1), (x##ull)>>LBITS
#define SC_LIMB(x) (x##ull)&((1ull<<32)-1), (x##ull)>>32
#else
#error "Only supporting 32- and 64-bit platforms right now"
#endif
#define FIELD_LITERAL(a,b,c,d,e,f,g,h) {{LIMB(a),LIMB(b),LIMB(c),LIMB(d),LIMB(e),LIMB(f),LIMB(g),LIMB(h)}}

#define VERIFY_ERROR 2
#define DECODE_ERROR 1
#define SUCCESS 0

static const decaf_448_scalar_t sc_p = {{{
    SC_LIMB(0x2378c292ab5844f3),
    SC_LIMB(0x216cc2728dc58f55),
    SC_LIMB(0xc44edb49aed63690),
    SC_LIMB(0xffffffff7cca23e9),
    SC_LIMB(0xffffffffffffffff),
    SC_LIMB(0xffffffffffffffff),
    SC_LIMB(0x3fffffffffffffff)
}}};

static const decaf_448_point_t g1 = {{
    {FIELD_LITERAL(0x00fffffffffffffe,0x00ffffffffffffff,0x00ffffffffffffff,0x00ffffffffffffff,
                   0x0000000000000003,0x0000000000000000,0x0000000000000000,0x0000000000000000)},
    {FIELD_LITERAL(0x0081e6d37f752992,0x003078ead1c28721,0x00135cfd2394666c,0x0041149c50506061,
                   0x0031d30e4f5490b3,0x00902014990dc141,0x0052341b04c1e328,0x0014237853c10a1b)},
    {FIELD_LITERAL(0x00fffffffffffffb,0x00ffffffffffffff,0x00ffffffffffffff,0x00ffffffffffffff,
                   0x00fffffffffffffe,0x00ffffffffffffff,0x00ffffffffffffff,0x00ffffffffffffff)},
    {FIELD_LITERAL(0x008f205b70660415,0x00881c60cfd3824f,0x00377a638d08500d,0x008c66d5d4672615,
                   0x00e52fa558e08e13,0x0087770ae1b6983d,0x004388f55a0aa7ff,0x00b4d9a785cf1a91)}
}};

//G2 found in test.c/find_generator
static const decaf_448_point_t g2 = {{
    {FIELD_LITERAL(0x00ac97f43cf14237,0x00dc98db8a9543bc,0x007874a17bcca6a6,0x00fffa76321af78f,
                   0x0074f2a89cf2ac0b,0x00356a31ef89f88d,0x000c010839f61e5a,0x000bf3b5cc84b7a5)},
    {FIELD_LITERAL(0x006b775bc0c9a64c,0x00ee0c3e126148bb,0x004fad09b303aa98,0x003008555efaf59d,
                   0x0023bc0fa72a0bf6,0x00f0f61f9c52ee5b,0x00b8b7f385cf8d7f,0x006a9849a18a4398)},
    {FIELD_LITERAL(0x00198c24c14e2fce,0x00080f748b74b290,0x008ab2f53fb60b6e,0x0069791886c32b60,
                   0x0087ecac7e87a66d,0x0035faebff354ebd,0x00c96f513e30d07f,0x00da28e58fab82ed)},
    {FIELD_LITERAL(0x005c67537702239a,0x00fae388ece76a54,0x006b5fe3d34bcae9,0x009cac77dd3c37ae,
                   0x00a02246f761a657,0x009448b046490757,0x00e0bd3d45281bbe,0x007c655f9abc5ecb)}
}};

void
cramershoup_448_random_symmetric_key(cramershoup_448_symmetric_key_t k)
{
    decaf_448_symmetric_key_t proto;
    random_bytes_strong(proto,sizeof(proto));

    const char *magic = "cramershoup_secret";
    uint8_t encoded_scalar[DECAF_448_SCALAR_BYTES+8];

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, proto, sizeof(decaf_448_symmetric_key_t));
    shake256_update(sponge, (uint8_t *)magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_t r;
    decaf_448_scalar_decode_long(r, encoded_scalar, sizeof(r));
    decaf_448_point_t g1r;
    decaf_448_point_scalarmul(g1r, decaf_448_point_base, r);
    decaf_448_point_encode(k,g1r);
}

void random_scalar_long_term(decaf_448_scalar_t secret_scalar)
{
    decaf_448_symmetric_key_t proto;
    random_bytes_long_term(proto,sizeof(proto));

    const char *magic = "cramershoup_secret";
    uint8_t encoded_scalar[DECAF_448_SCALAR_BYTES+8];

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, proto, sizeof(decaf_448_symmetric_key_t));
    shake256_update(sponge, (uint8_t*)magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_decode_long(secret_scalar, encoded_scalar, sizeof(encoded_scalar));
    decaf_bzero(encoded_scalar, sizeof(encoded_scalar));
}

void random_scalar_strong(decaf_448_scalar_t secret_scalar)
{
    decaf_448_symmetric_key_t proto;
    random_bytes_strong(proto,sizeof(proto));

    const char *magic = "cramershoup_secret";
    uint8_t encoded_scalar[DECAF_448_SCALAR_BYTES+8];

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, proto, sizeof(decaf_448_symmetric_key_t));
    shake256_update(sponge, (uint8_t*) magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_decode_long(secret_scalar, encoded_scalar, sizeof(encoded_scalar));
    decaf_bzero(encoded_scalar, sizeof(encoded_scalar));
}

void random_scalar_nonce(decaf_448_scalar_t secret_scalar)
{
    decaf_448_symmetric_key_t proto;
    random_bytes_nonce(proto,sizeof(proto));

    const char *magic = "cramershoup_secret";
    uint8_t encoded_scalar[DECAF_448_SCALAR_BYTES+8];

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, proto, sizeof(decaf_448_symmetric_key_t));
    shake256_update(sponge, (uint8_t*)magic, strlen(magic));
    shake256_final(sponge, encoded_scalar, sizeof(encoded_scalar));
    shake256_destroy(sponge);

    decaf_448_scalar_decode_long(secret_scalar, encoded_scalar, sizeof(encoded_scalar));
    decaf_bzero(encoded_scalar, sizeof(encoded_scalar));
}

void
shake256_update_decaf_point(keccak_sponge_t sponge, const decaf_448_point_t p)
{
    uint8_t pp[DECAF_448_SCALAR_BYTES] = {0};
    decaf_448_point_encode(pp, p);
    shake256_update(sponge, pp, DECAF_448_SER_BYTES);
}

void
shake256_update_decaf_scalar(keccak_sponge_t sponge, const decaf_448_scalar_t p)
{
    uint8_t pp[DECAF_448_SCALAR_BYTES] = {0};
    decaf_448_scalar_encode(pp, p);
    shake256_update(sponge, pp, DECAF_448_SCALAR_BYTES);
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
    //Private key
    random_scalar_long_term(priv->x1);
    random_scalar_long_term(priv->x2);
    random_scalar_long_term(priv->y1);
    random_scalar_long_term(priv->y2);
    random_scalar_long_term(priv->z);

    //Public key
    decaf_448_point_double_scalarmul(pub->c, g1, priv->x1, g2, priv->x2);
    decaf_448_point_double_scalarmul(pub->d, g1, priv->y1, g2, priv->y2);
    decaf_448_point_scalarmul(pub->h, g1, priv->z);
}

void
cramershoup_448_public_key_copy(cramershoup_448_public_key_t *dst, const cramershoup_448_public_key_t *src) {
  decaf_448_point_copy(dst->c, src->c);
  decaf_448_point_copy(dst->d, src->d);
  decaf_448_point_copy(dst->h, src->h);
}

void
fatal(const char* func, const char* msg)
{
    perror(func);
    perror(msg);
}

int
cramershoup_448_enc(
        cramershoup_448_encrypted_key_t encrypted_key,
        const cramershoup_448_symmetric_key_t symmetric_key,
        const cramershoup_448_public_key_t *pub)
{

    decaf_448_scalar_t k, a;
    decaf_448_point_t u1, u2, m, e;
    random_scalar_strong(k);
    //u1 = G1*k, u2 = G2*k
    decaf_448_point_scalarmul(u1,g1,k);
    decaf_448_point_scalarmul(u2,g2,k);
    //e = (h*k) + m
    decaf_bool_t valid = decaf_448_point_decode(m, symmetric_key, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_enc", "m decode failure\n");
        return DECODE_ERROR;
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

    decaf_448_point_encode(encrypted_key,u1);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES,u2);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*2,e);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*3,v);
    return SUCCESS;
}

int
cramershoup_448_dec(
        cramershoup_448_symmetric_key_t symmetric_key,
        const cramershoup_448_encrypted_key_t encrypted_key,
        const cramershoup_448_private_key_t *priv)
{
    decaf_448_point_t u1, u2, e, v;
    decaf_bool_t valid = decaf_448_point_decode(u1, encrypted_key, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(u2, encrypted_key+DECAF_448_SER_BYTES, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "u2 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(e, encrypted_key+DECAF_448_SER_BYTES*2, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "e decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(v, encrypted_key+DECAF_448_SER_BYTES*3, DECAF_FALSE);
    if (!valid){
        fatal("cramershoup_dec", "v decode failure\n");
        return DECODE_ERROR;
    }

    //Verify v
    //α = H(u1,u2,e)
    decaf_448_scalar_t a;
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, encrypted_key, DECAF_448_SER_BYTES*3);
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
        return VERIFY_ERROR;
    }

    //Decrypt m = e - u1*z
    decaf_448_point_t m;
    decaf_448_point_scalarmul(m,u1,priv->z);
    decaf_448_point_sub(m,e,m);
    decaf_448_point_encode(symmetric_key, m);
    return SUCCESS;
}


int
dr_cramershoup_448_enc(
        cramershoup_448_dr_encrypted_key_t encrypted_key,
        const cramershoup_448_symmetric_key_t symmetric_key,
        const cramershoup_448_public_key_t *pub1,
        const cramershoup_448_public_key_t *pub2)
{
    decaf_448_scalar_t k1, k2, a1, a2;
    decaf_448_point_t m;
    decaf_448_point_t u11, u21, e1;
    decaf_448_point_t u12, u22, e2;
    random_scalar_strong(k1);
    random_scalar_strong(k2);
    //u1 = G1*k, u2 = G2*k
    decaf_448_point_scalarmul(u11,g1,k1);
    decaf_448_point_scalarmul(u21,g2,k1);
    decaf_448_point_scalarmul(u12,g1,k2);
    decaf_448_point_scalarmul(u22,g2,k2);
    //e = (h*k) + m
    decaf_bool_t valid = decaf_448_point_decode(m, symmetric_key, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_enc", "m decode failure\n");
        return DECODE_ERROR;
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
    random_scalar_strong(t1);
    random_scalar_strong(t2);

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
    shake256_update_decaf_scalar(sponge, sc_p);
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

    decaf_448_point_encode(encrypted_key,u11);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES,u21);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*2,e1);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*3,v1);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*4,u12);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*5,u22);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*6,e2);
    decaf_448_point_encode(encrypted_key+DECAF_448_SER_BYTES*7,v2);
    decaf_448_scalar_encode(encrypted_key+DECAF_448_SCALAR_BYTES*8,l);
    decaf_448_scalar_encode(encrypted_key+DECAF_448_SCALAR_BYTES*9,n1);
    decaf_448_scalar_encode(encrypted_key+DECAF_448_SCALAR_BYTES*10,n2);
    return SUCCESS;
}

int
dr_cramershoup_448_dec(
        cramershoup_448_symmetric_key_t symmetric_key,
        const cramershoup_448_dr_encrypted_key_t encrypted_key,
        const cramershoup_448_public_key_t *pub1,
        const cramershoup_448_public_key_t *pub2,
        const cramershoup_448_private_key_t *priv,
        int index)
{
    decaf_448_point_t u11, u21, e1, v1, u12, u22, e2, v2;
    decaf_448_scalar_t l, n1, n2;
    decaf_bool_t valid;
    valid = decaf_448_point_decode(u11, encrypted_key, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "u11 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(u21, encrypted_key+DECAF_448_SER_BYTES, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "u21 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(e1, encrypted_key+DECAF_448_SER_BYTES*2, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "e1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(v1, encrypted_key+DECAF_448_SER_BYTES*3, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "v1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(u12, encrypted_key+DECAF_448_SER_BYTES*4, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "u12 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(u22, encrypted_key+DECAF_448_SER_BYTES*5, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "u22 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(e2, encrypted_key+DECAF_448_SER_BYTES*6, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "e2 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_point_decode(v2, encrypted_key+DECAF_448_SER_BYTES*7, DECAF_FALSE);
    if (!valid){
        fatal("dr_cramershoup_dec", "v2 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(l, encrypted_key+DECAF_448_SCALAR_BYTES*8);
    if (!valid){
        fatal("dr_cramershoup_dec", "l decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(n1, encrypted_key+DECAF_448_SCALAR_BYTES*9);
    if (!valid){
        fatal("dr_cramershoup_dec", "n1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(n2, encrypted_key+DECAF_448_SCALAR_BYTES*10);
    if (!valid){
        fatal("dr_cramershoup_dec", "n2 decode failure\n");
        return DECODE_ERROR;
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
    shake256_update_decaf_scalar(sponge, sc_p);
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
        fatal("dr_cramershoup_dec", "l verify failure\n");
        return VERIFY_ERROR;
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
        fatal("dr_cramershoup_dec", "v verify failure\n");
        return VERIFY_ERROR;
    }

    decaf_448_point_t k;
    if(index == 1){
        decaf_448_point_scalarmul(k, u11, priv->z);
        decaf_448_point_sub(k, e1, k);
    } else {
        decaf_448_point_scalarmul(k, u12, priv->z);
        decaf_448_point_sub(k, e2, k);
    }
    decaf_448_point_encode(symmetric_key, k);
    return SUCCESS;
}

void
rs_448_auth(
        cramershoup_448_rs_auth_t sigma,
        const char *m,
        const decaf_448_scalar_t s1,
        const decaf_448_point_t p1,
        const decaf_448_point_t p2,
        const decaf_448_point_t p3)
{
    decaf_448_scalar_t t1, c1, c2, c3, r1, r2, r3;
    decaf_448_point_t tp1, tp2, tp3;

    //TODO: t1 is secret, but others are just public nonce
    random_scalar_strong(t1);
    random_scalar_nonce(c2);
    random_scalar_nonce(c3);
    random_scalar_nonce(r2);
    random_scalar_nonce(r3);
    decaf_448_point_scalarmul(tp1, g1, t1);
    decaf_448_point_double_scalarmul(tp2, g1, r2, p2, c2);
    decaf_448_point_double_scalarmul(tp3, g1, r3, p3, c3);

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update_decaf_point(sponge,g1);
    shake256_update_decaf_scalar(sponge, sc_p);
    shake256_update_decaf_point(sponge,p1);
    shake256_update_decaf_point(sponge,p2);
    shake256_update_decaf_point(sponge,p3);
    shake256_update_decaf_point(sponge,tp1);
    shake256_update_decaf_point(sponge,tp2);
    shake256_update_decaf_point(sponge,tp3);
    shake256_update(sponge, (uint8_t*)m, strlen(m));

    decaf_448_scalar_t c;
    shake256_final_decaf_scalar(sponge, c);
    shake256_destroy(sponge);

    decaf_448_scalar_sub(c1, c, c2);
    decaf_448_scalar_sub(c1, c1, c3);

    decaf_448_scalar_mul(c, c1, s1);
    decaf_448_scalar_sub(r1, t1, c);

    decaf_448_scalar_encode(sigma, c1);
    decaf_448_scalar_encode(sigma+DECAF_448_SCALAR_BYTES, r1);
    decaf_448_scalar_encode(sigma+DECAF_448_SCALAR_BYTES*2, c2);
    decaf_448_scalar_encode(sigma+DECAF_448_SCALAR_BYTES*3, r2);
    decaf_448_scalar_encode(sigma+DECAF_448_SCALAR_BYTES*4, c3);
    decaf_448_scalar_encode(sigma+DECAF_448_SCALAR_BYTES*5, r3);
}

int
rs_448_verify(
        const cramershoup_448_rs_auth_t sigma,
        const char *m,
        const decaf_448_point_t p1,
        const decaf_448_point_t p2,
        const decaf_448_point_t p3)
{
    decaf_448_scalar_t c1, c2, c3, r1, r2, r3;
    decaf_448_point_t tp1, tp2, tp3;
    decaf_bool_t valid = decaf_448_scalar_decode(c1, sigma);
    if (!valid){
        fatal("rs_verify", "c1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(r1, sigma+DECAF_448_SCALAR_BYTES);
    if (!valid){
        fatal("rs_verify", "r1 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(c2, sigma+DECAF_448_SCALAR_BYTES*2);
    if (!valid){
        fatal("rs_verify", "c2 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(r2, sigma+DECAF_448_SCALAR_BYTES*3);
    if (!valid){
        fatal("rs_verify", "r2 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(c3, sigma+DECAF_448_SCALAR_BYTES*4);
    if (!valid){
        fatal("rs_verify", "c3 decode failure\n");
        return DECODE_ERROR;
    }
    valid = decaf_448_scalar_decode(r3, sigma+DECAF_448_SCALAR_BYTES*5);
    if (!valid){
        fatal("rs_verify", "r3 decode failure\n");
        return DECODE_ERROR;
    }

    decaf_448_point_double_scalarmul(tp1, g1, r1, p1, c1);
    decaf_448_point_double_scalarmul(tp2, g1, r2, p2, c2);
    decaf_448_point_double_scalarmul(tp3, g1, r3, p3, c3);


    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update_decaf_point(sponge,g1);
    shake256_update_decaf_scalar(sponge,sc_p);
    shake256_update_decaf_point(sponge,p1);
    shake256_update_decaf_point(sponge,p2);
    shake256_update_decaf_point(sponge,p3);
    shake256_update_decaf_point(sponge,tp1);
    shake256_update_decaf_point(sponge,tp2);
    shake256_update_decaf_point(sponge,tp3);
    shake256_update(sponge, (uint8_t*)m, strlen(m));

    decaf_448_scalar_t c, challenge;
    shake256_final_decaf_scalar(sponge, c);
    shake256_destroy(sponge);

    decaf_448_scalar_add(challenge, c1, c2);
    decaf_448_scalar_add(challenge, challenge, c3);

    decaf_bool_t equal = decaf_448_scalar_eq(c, challenge);
    if(!equal) return VERIFY_ERROR;
    return SUCCESS;
}
