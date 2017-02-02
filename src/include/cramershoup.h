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

#ifndef _BOOTSTRAP_H
#define _BOOTSTRAP_H

#if HAVE_CONFIG_H
#  include <config.h>
#endif

#include <stdlib.h>

/* TODO:5001 Declare here functions that you will use in several files. Those
 * TODO:5001 functions should not be prefixed with `static` keyword. All other
 * TODO:5001 functions should.
 */
#include <libdecaf/decaf.h>
typedef struct {
    decaf_448_scalar_t x1,x2,y1,y2,z;
} cramershoup_448_private_key_t;

typedef struct {
    decaf_448_point_t c,d,h;
} cramershoup_448_public_key_t;

typedef uint8_t cramershoup_448_symmetric_key_t[DECAF_448_SER_BYTES];
typedef uint8_t cramershoup_448_encrypted_key_t[DECAF_448_SER_BYTES*4];
typedef uint8_t cramershoup_448_dr_encrypted_key_t[DECAF_448_SER_BYTES*8+DECAF_448_SCALAR_BYTES*3];

/*
 * cramershoup_448_random_symmetric_key
 * generate a random cramershoup_448_symmetric_key_t
 */
void
cramershoup_448_random_symmetric_key(cramershoup_448_symmetric_key_t *k);

/*
 * cramershoup_448_derive_keys
 * generate a new pair of cramershoup_448 keys
 */
void
cramershoup_448_derive_keys(
        cramershoup_448_private_key_t *priv,
        cramershoup_448_public_key_t *pub);

/*
 * cramershoup_448_public_key_copy
 * copies a public key
 */
void
cramershoup_448_public_key_copy(
        cramershoup_448_public_key_t *dst,
        const cramershoup_448_public_key_t *src);

/*
 * cramershoup_448_enc
 * encrypt symmetric_key with a cramershoup_448_public_key_t
 * symmetric_key need to be decodable through decaf_448_point_decode
 * Return success 0 as result of encryption
 */
int
cramershoup_448_enc(
        cramershoup_448_encrypted_key_t *encrypted_key,
        const cramershoup_448_symmetric_key_t *symmetric_key,
        cramershoup_448_public_key_t *pub);

/*
 * cramershoup_448_dec
 * decrypt encrypted_key with a cramershoup_448_private_key_t
 * Return success 0 as result of decryption
 */
int
cramershoup_448_dec(
        cramershoup_448_symmetric_key_t *symmetric_key,
        const cramershoup_448_encrypted_key_t *encrypted_key,
        cramershoup_448_private_key_t *priv);

/*
 * dr_cramershoup_448_enc
 * encrypt symmetric_key with dual cramershoup_448_public_key_t
 * symmetric_key need to be decodable through decaf_448_point_decode
 * Return success 0 as result of encryption
 */
int
dr_cramershoup_448_enc(
        cramershoup_448_dr_encrypted_key_t *encrypted_key,
        const cramershoup_448_symmetric_key_t *symmetric_key,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2);

/*
 * dr_cramershoup_448_dec
 * verify encrypted_key with dual cramershoup_448_public_key_t
 * decrypt encrypted_key with one cramershoup_448_private_key_t
 * Return success 0 as result of decryption
 */
int
dr_cramershoup_448_dec(
        cramershoup_448_symmetric_key_t *symmetric_key,
        const cramershoup_448_dr_encrypted_key_t *encrypted_key,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2,
        cramershoup_448_private_key_t *priv,
        int index);

/*
 * rs_448_auth
 * Ring Signature authentication on ed448 decaf
 * Authenticate message with one decaf_448_scalar_t secret key
 * correspondent to one of three decaf_448_point_t public keys,
 * Output sigma as the signature of m.
 */
void
rs_448_auth(
        unsigned char *sigma,
        decaf_448_scalar_t s1,
        decaf_448_point_t p1,
        decaf_448_point_t p2,
        decaf_448_point_t p3,
        const char *m);

/*
 * rs_448_verify
 * Ring Signature verification on ed448 decaf
 * Verify the signature of message with
 * three decaf_448_point_t public keys,
 * Sigma as the signature of m.
 * Return success 0 as result of verification
 */
int
rs_448_verify(
        decaf_448_point_t p1,
        decaf_448_point_t p2,
        decaf_448_point_t p3,
        unsigned char *sigma,
        const char *m);
#endif

