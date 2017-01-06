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
#include <unistd.h>
#include <string.h>
#include <getopt.h>
#include "decaf_crypto.h"
#include "randombytes.h"

extern const char *__progname;

static void
usage(void)
{
    fprintf(stderr, "Usage: %s [OPTIONS]\n",
            __progname);
    fprintf(stderr, "Version: %s\n", PACKAGE_STRING);
    fprintf(stderr, "\n");
    fprintf(stderr, " -d, --debug        be more verbose.\n");
    fprintf(stderr, " -h, --help         display help and exit\n");
    fprintf(stderr, " -v, --version      print version and exit\n");
    fprintf(stderr, " -g, --generator    print generator\n");
    fprintf(stderr, " -G, --keygen       generate a keypair\n");
    fprintf(stderr, " -E, --enc          encrypt\n");
    fprintf(stderr, " -D, --dec          decrypt\n");
    fprintf(stderr, " -T, --test         end to end test\n");
    fprintf(stderr, "\n");
    fprintf(stderr, "see manual page " PACKAGE "(8) for more information\n");
}

char *
sprint_encoded_scalar(decaf_448_scalar_t s)
{
    char *buf;
    buf = malloc(sizeof(char)*DECAF_448_SCALAR_BYTES*2);
    unsigned char ser[DECAF_448_SCALAR_BYTES];
    decaf_448_scalar_encode(ser,s);
    for (int i = 0; i < DECAF_448_SCALAR_BYTES; i++){
        sprintf(&buf[i*2], "%02x", (uint8_t) ser[i]);
    }
    return buf;
}

char *
sprint_encoded_point(decaf_448_point_t p)
{
    char *buf;
    buf = malloc(sizeof(char)*DECAF_448_SER_BYTES*2);
    unsigned char ser[DECAF_448_SER_BYTES];
    decaf_448_point_encode(ser,p);
    for (int i = 0; i < DECAF_448_SER_BYTES; i++){
        sprintf(&buf[i*2], "%02x", (uint8_t) ser[i]);
    }
    return buf;
}

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

void
print_generators()
{
    decaf_448_point_t g1, g2;

    decaf_448_point_copy(g1, decaf_448_point_base);
    find_g2(g2);
    printf("G1: %s\n", sprint_encoded_point(g1));
    printf("G2: %s\n", sprint_encoded_point(g2));
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
derive_key(private_key_t *priv, public_key_t *pub)
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
save_key(FILE *file, private_key_t *priv, public_key_t *pub)
{
    // private_key
    unsigned char *x1,*x2,*y1,*y2,*z;
    x1 = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    x2 = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    y1 = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    y2 = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    z  = malloc(sizeof(unsigned char)*DECAF_448_SCALAR_BYTES);
    decaf_448_scalar_encode(x1,priv->x1);
    decaf_448_scalar_encode(x2,priv->x2);
    decaf_448_scalar_encode(y1,priv->y1);
    decaf_448_scalar_encode(y2,priv->y2);
    decaf_448_scalar_encode(z ,priv->z);
    fwrite(x1, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    fwrite(x2, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    fwrite(y1, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    fwrite(y2, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    fwrite(z , sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);

    // public_key
    unsigned char *c,*d,*h;
    c = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    d = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    h = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
    decaf_448_point_encode(c,pub->c);
    decaf_448_point_encode(d,pub->d);
    decaf_448_point_encode(h,pub->h);
    fwrite(c, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    fwrite(d, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    fwrite(h, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
}

void
parse_key_file(private_key_t *priv, public_key_t *pub, FILE* file)
{
    if(!file){
        fatal("parse_key_file", "file read failure\n");
    }
    decaf_bool_t valid;
    unsigned char buffer[DECAF_448_SCALAR_BYTES];

    fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->x1, (const unsigned char *)buffer);
    if (!valid){
        fatal("parse_key_file", "x1 decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->x2, (const unsigned char *)buffer);
    if (!valid){
        fatal("parse_key_file", "x2 decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->y1, (const unsigned char *)buffer);
    if (!valid){
        fatal("parse_key_file", "y1 decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->y2, (const unsigned char *)buffer);
    if (!valid){
        fatal("parse_key_file", "y2 decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->z , (const unsigned char *)buffer);
    if (!valid){
        fatal("parse_key_file", "z decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->c, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid){
        fatal("parse_key_file", "c decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->d, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid){
        fatal("parse_key_file", "d decode failure\n");
    }

    fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->h, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid){
        fatal("parse_key_file", "h decode failure\n");
    }
}

void
cramershoup_enc(unsigned char *ciphertext, const unsigned char *plaintext, public_key_t *pub)
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
cramershoup_dec(unsigned char *plaintext, const unsigned char *ciphertext, private_key_t *priv)
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


int
main(int argc, char *argv[])
{
    int debug = 1;
    int keygen = 0;
    int enc = 0;
    int dec = 0;
    int end_to_end = 0;
    int ch;

    static struct option long_options[] = {
        { "debug", optional_argument, 0, 'd' },
        { "help",  no_argument, 0, 'h' },
        { "version", no_argument, 0, 'v' },
        { "generator", no_argument, 0, 'g' },
        { "keygen", required_argument, 0, 'G' },
        { "enc", required_argument, 0, 'E' },
        { "dec", required_argument, 0, 'D' },
        { "test", required_argument, 0, 'T' },
        { 0 }
    };

    struct globalArgs_t {
        const char *keyFileName;    /* -o option */
    } globalArgs;

    while (1) {
        int option_index = 0;
        ch = getopt_long(argc, argv, "hvgdT:G:E:D:",
                long_options, &option_index);
        if (ch == -1) break;
        switch (ch) {
            case 'h':
                usage();
                exit(0);
                break;
            case 'v':
                fprintf(stdout, "%s\n", PACKAGE_VERSION);
                exit(0);
                break;
            case 'g':
                print_generators();
                exit(0);
                break;
            case 'G':
                globalArgs.keyFileName = optarg;
                keygen++;
                break;
            case 'E':
                globalArgs.keyFileName = optarg;
                enc++;
                break;
            case 'D':
                globalArgs.keyFileName = optarg;
                dec++;
                break;
            case 'T':
                globalArgs.keyFileName = optarg;
                end_to_end++;
                break;
            case 'd':
                log_accept(optarg);
                debug++;
                break;
            default:
                fprintf(stderr, "unknown option `%c'\n", ch);
                usage();
                exit(1);
        }
    }

    log_init(debug, __progname);

    if (keygen)
    {
        private_key_t private_key;
        public_key_t public_key;
        derive_key(&private_key, &public_key);
        FILE *fp = fopen(globalArgs.keyFileName, "w"); // Open file for writing
        save_key(fp, &private_key, &public_key);
        fclose(fp);
    }

    if (enc)
    {
        FILE *fp = fopen(globalArgs.keyFileName, "r"); // Open file for reading
        private_key_t private_key;
        public_key_t public_key;
        parse_key_file(&private_key, &public_key, fp);
        fclose(fp);

        decaf_448_scalar_t r;
        random_scalar(r);
        decaf_448_point_t g1r;
        decaf_448_point_scalarmul(g1r, decaf_448_point_base, r);
        unsigned char *plaintext = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
        unsigned char *ciphertext = malloc(sizeof(unsigned char)*(DECAF_448_SER_BYTES*4));

        printf("plaintext: \n");
        decaf_448_point_encode(plaintext,g1r);
        for (int i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", plaintext[i]);
        }
        printf("\n");

        cramershoup_enc(ciphertext, plaintext, &public_key);
        printf("ciphertext:\n");
        for (int j = 0; j < 4; j++){
            for (int i = 0; i < DECAF_448_SER_BYTES; i++){
                printf("%02x", ciphertext[i+DECAF_448_SER_BYTES*j]);
            }
            printf("\n");
        }
    }

    if (dec)
    {
        fatal("dec", "decryption not implemented\n");
    }

    if (end_to_end)
    {
        FILE *fp = fopen(globalArgs.keyFileName, "r"); // Open file for reading
        private_key_t private_key;
        public_key_t public_key;
        parse_key_file(&private_key, &public_key, fp);
        fclose(fp);

        unsigned char *plaintext = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
        unsigned char *ciphertext = malloc(sizeof(unsigned char)*(DECAF_448_SER_BYTES*4));
        decaf_448_scalar_t r;
        random_scalar(r);
        decaf_448_point_t g1r;
        decaf_448_point_scalarmul(g1r, decaf_448_point_base, r);
        printf("plaintext: \n");
        decaf_448_point_encode(plaintext,g1r);
        for (int i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", plaintext[i]);
        }
        printf("\n");
        cramershoup_enc(ciphertext, plaintext, &public_key);
        printf("ciphertext:\n");
        for (int j = 0; j < 4; j++){
            for (int i = 0; i < DECAF_448_SER_BYTES; i++){
                printf("%02x", ciphertext[i+DECAF_448_SER_BYTES*j]);
            }
            printf("\n");
        }

        unsigned char *decrypted = malloc(sizeof(unsigned char)*DECAF_448_SER_BYTES);
        cramershoup_dec(decrypted, ciphertext, &private_key);
        printf("decrypted: \n");
        for (int i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", decrypted[i]);
        }
        printf("\n");
    }

    return EXIT_SUCCESS;
}
