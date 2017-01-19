/* -*- mode: c; c-file-style: "openbsd" -*- */
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

#ifndef _BOOTSTRAP_H
#define _BOOTSTRAP_H

#if HAVE_CONFIG_H
#  include <config.h>
#endif

#include "log.h"

#include <stdlib.h>

/* TODO:5001 Declare here functions that you will use in several files. Those
 * TODO:5001 functions should not be prefixed with `static` keyword. All other
 * TODO:5001 functions should.
 */
#include "libdecaf/decaf.h"
typedef struct {
    decaf_448_scalar_t x1,x2,y1,y2,z;
} private_key_t;

typedef struct {
    decaf_448_point_t c,d,h;
} public_key_t;

void
cramershoup_448_derive_keys(private_key_t *priv, public_key_t *pub);

void
cramershoup_448_enc(unsigned char *ciphertext, const unsigned char *plaintext, public_key_t *pub);
void
cramershoup_448_dec(unsigned char *plaintext, const unsigned char *ciphertext, private_key_t *priv);

#endif

