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

/*
 * cramershoup_448_derive_keys
 * generate a new pair of cramershoup_448 keys
 */
void
cramershoup_448_derive_keys(
        cramershoup_448_private_key_t *priv,
        cramershoup_448_public_key_t *pub);

/*
 * cramershoup_448_enc
 * encrypt plaintext with a cramershoup_448_public_key_t
 * plaintext need to be decodable through decaf_448_point_decode
 */
void
cramershoup_448_enc(
        unsigned char *ciphertext,
        const unsigned char *plaintext,
        cramershoup_448_public_key_t *pub);

/*
 * cramershoup_448_dec
 * decrypt ciphertext with a cramershoup_448_private_key_t
 */
void
cramershoup_448_dec(
        unsigned char *plaintext,
        const unsigned char *ciphertext,
        cramershoup_448_private_key_t *priv);

/*
 * dr_cramershoup_448_enc
 * encrypt plaintext with dual cramershoup_448_public_key_t
 * plaintext need to be decodable through decaf_448_point_decode
 */
void
dr_cramershoup_448_enc(
        unsigned char *ciphertext,
        const unsigned char *plaintext,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2);

/*
 * dr_cramershoup_448_dec
 * verify ciphertext with dual cramershoup_448_public_key_t
 * decrypt ciphertext with one cramershoup_448_private_key_t
 */
void
dr_cramershoup_448_dec(
        unsigned char *plaintext,
        const unsigned char *ciphertext,
        cramershoup_448_public_key_t *pub1,
        cramershoup_448_public_key_t *pub2,
        cramershoup_448_private_key_t *priv,
        int index);
#endif

