/* -*- mode: c; c-file-style: "openbsd" -*- */
/* TODO:5002 You may want to change the copyright of all files. This is the
 * TODO:5002 ISC license. Choose another one if you want.
 */
/*
 * Copyright (c) 2014 Fan Jiang <fan.torchz@gmail.com>
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
#include "decaf_crypto.h"
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
cramershoup_448_derive_keys(private_key_t *priv, public_key_t *pub)
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
cramershoup_448_enc(unsigned char *ciphertext, const unsigned char *plaintext, public_key_t *pub)
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
    unsigned char *aa = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    unsigned char *uu1 = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    unsigned char *uu2 = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    unsigned char *ee = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);

    decaf_448_point_encode(uu1, u1);
    decaf_448_point_encode(uu2, u2);
    decaf_448_point_encode(ee, e);

    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, (const unsigned char *)uu1, DECAF_448_SER_BYTES);
    shake256_update(sponge, (const unsigned char *)uu2, DECAF_448_SER_BYTES);
    shake256_update(sponge, (const unsigned char *)ee, DECAF_448_SER_BYTES);
    shake256_final(sponge, aa, sizeof(aa));
    shake256_destroy(sponge);

    // XXX should we always reduce before decode?
    decaf_448_scalar_decode_long(a, aa, sizeof(aa));
    decaf_bzero(aa, sizeof(aa));

    // v = c*k + d*(k * α)
    decaf_448_point_t ck, dka, v;
    decaf_448_point_scalarmul(ck,pub->c,k);
    decaf_448_point_scalarmul(dka,pub->d,k);
    decaf_448_point_scalarmul(dka,dka,a);
    decaf_448_point_add(v,ck,dka);

    decaf_448_point_encode(ciphertext,u1);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES,u2);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*2,e);
    decaf_448_point_encode(ciphertext+DECAF_448_SER_BYTES*3,v);
}

void
cramershoup_448_dec(unsigned char *plaintext, const unsigned char *ciphertext, private_key_t *priv)
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
    unsigned char *aa = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    keccak_sponge_t sponge;
    shake256_init(sponge);
    shake256_update(sponge, (const unsigned char *)ciphertext, DECAF_448_SER_BYTES*3);
    shake256_final(sponge, aa, sizeof(aa));
    shake256_destroy(sponge);

    // XXX should we always reduce before decode?
    decaf_448_scalar_decode_long(a, aa, sizeof(aa));
    decaf_bzero(aa, sizeof(aa));

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
    decaf_448_point_negate(m,m);
    decaf_448_point_add(m,e,m);
    decaf_448_point_encode(plaintext, m);
}
