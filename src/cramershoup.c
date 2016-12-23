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
#include "goldilocks.h"

extern const char *__progname;

static void
usage(void)
{
	/* TODO:3002 Don't forget to update the usage block with the most
	 * TODO:3002 important options. */
	fprintf(stderr, "Usage: %s [OPTIONS]\n",
	    __progname);
	fprintf(stderr, "Version: %s\n", PACKAGE_STRING);
	fprintf(stderr, "\n");
	fprintf(stderr, " -d, --debug        be more verbose.\n");
	fprintf(stderr, " -h, --help         display help and exit\n");
	fprintf(stderr, " -v, --version      print version and exit\n");
	fprintf(stderr, "\n");
	fprintf(stderr, "see manual page " PACKAGE "(8) for more information\n");
}

int
main(int argc, char *argv[])
{
	int debug = 1;
	int ch;

	/* TODO:3001 If you want to add more options, add them here. */
	static struct option long_options[] = {
                { "debug", no_argument, 0, 'd' },
                { "help",  no_argument, 0, 'h' },
                { "version", no_argument, 0, 'v' },
		{ 0 }
	};
	while (1) {
		int option_index = 0;
		ch = getopt_long(argc, argv, "hvdD:",
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
		case 'd':
			debug++;
			break;
		case 'D':
			log_accept(optarg);
			break;
		default:
			fprintf(stderr, "unknown option `%c'\n", ch);
			usage();
			exit(1);
		}
	}

	log_init(debug, __progname);

    const char *message1 = "hello world";
    const char *message2 = "Jello world";

    unsigned char signature[GOLDI_SIGNATURE_BYTES];

    unsigned char
        ss12[GOLDI_SHARED_SECRET_BYTES],
        ss21[GOLDI_SHARED_SECRET_BYTES],
        ss21p[GOLDI_SHARED_SECRET_BYTES],
        proto[GOLDI_SYMKEY_BYTES];

    struct goldilocks_public_key_t  pub;
    struct goldilocks_private_key_t priv;
    struct goldilocks_public_key_t  pub2;
    struct goldilocks_private_key_t priv2;
    struct goldilocks_precomputed_public_key_t *pre = NULL;

    int ret, good = 1;

    printf("Testing goldilocks...:\n");

    printf("goldilocks_init...\n");
    ret = goldilocks_init();
    if (ret) {
        log_warnx("main","    Failed init.\n");
    }

    printf("goldilocks_keygen...\n");
    ret = goldilocks_keygen(&priv, &pub);
    if (ret) {
        log_warnx("main","    Failed keygen trial.\n");
        good = 0;
    }

    goldilocks_destroy_precomputed_public_key( pre );
    printf("goldilocks_precompute_public_key...\n");
    pre = goldilocks_precompute_public_key ( &pub );
    if (!pre) {
        log_warnx("main","    Failed precomp-public trial.\n");
        return -1;
    }

    printf("goldilocks_sign...\n");
    ret = goldilocks_sign(
        signature,
        (const unsigned char *)message1,
        strlen(message1),
        &priv
    );
    if (ret) {
        log_warnx("main","    Failed sign trial.\n");
        good = 0;
    }

    printf("goldilocks_verify...\n");
    ret = goldilocks_verify(
        signature,
        (const unsigned char *)message1,
        strlen(message1),
        &pub
    );
    if (ret) {
        log_warnx("main","    Failed verify trial.\n");
        good = 0;
    }

    printf("goldilocks_verify_precomputed...\n");
    ret = goldilocks_verify_precomputed (
        signature,
        (const unsigned char *)message1,
        strlen(message1),
        pre
    );
    if (ret) {
        log_warnx("main","    Failed verify-pre trial.\n");
        good = 0;
    }

    printf("\nTerrible negative test...:\n");
    /* terrible negative test */
    printf("goldilocks_verify_should_fails...\n");
    ret = goldilocks_verify(
        signature,
        (const unsigned char *)message2,
        strlen(message1),
        &pub
    );
    if (ret != GOLDI_EINVAL) {
        log_warnx("main","    Failed nega-verify trial.\n");
        good = 0;
    }
    printf("goldilocks_verify_precomputed_should_fails...\n");
    ret = goldilocks_verify_precomputed(
        signature,
        (const unsigned char *)message2,
        strlen(message1),
        pre
    );
    if (ret != GOLDI_EINVAL) {
        log_warnx("main","    Failed nega-verify-pre trial.\n");
        good = 0;
    }

    printf("\nHonestly a slightly better negative test...:\n");
    /* honestly a slightly better negative test */
    memset(signature,0,sizeof(signature));
    printf("goldilocks_verify_should_fails...\n");
    ret = goldilocks_verify(
        signature,
        (const unsigned char *)message1,
        strlen(message1),
        &pub
    );
    if (ret != GOLDI_EINVAL) {
        log_warnx("main","    Failed nega-verify-0 trial.\n");
        good = 0;
    }
    printf("goldilocks_verify_precomputed_should_fails...\n");
    ret = goldilocks_verify_precomputed(
        signature,
        (const unsigned char *)message1,
        strlen(message1),
        pre
    );
    if (ret != GOLDI_EINVAL) {
        log_warnx("main","    Failed nega-verify-pre-0 trial.\n");
        good = 0;
    }

    /* ecdh */
    printf("\nECDH test...:\n");
    printf("goldilocks_keygen...\n");
    ret = goldilocks_keygen(&priv2, &pub2);
    if (ret) {
        log_warnx("main","    Failed keygen2 trial.\n");
        good = 0;
    }

    printf("goldilocks_shared_secret ss12...\n");
    ret = goldilocks_shared_secret ( ss12, &priv, &pub2 );
    if (ret) {
        log_warnx("main","    Failed ss12 trial.\n");
        good = 0;
    }

    printf("goldilocks_shared_secret ss21...\n");
    ret = goldilocks_shared_secret ( ss21, &priv2, &pub );
    if (ret) {
        log_warnx("main","    Failed ss21 trial.\n");
        good = 0;
    }

    printf("goldilocks_shared_secret_precomputed ss21...\n");
    ret = goldilocks_shared_secret_precomputed ( ss21p, &priv2, pre );
    if (ret) {
        log_warnx("main","    Failed ss21p trial.\n");
        good = 0;
    }

    printf("goldilocks_shared_secret ss21==ss12...\n");
    if (memcmp(ss12,ss21,sizeof(ss12))) {
        log_warnx("main","    Failed shared-secret trial.\n");
        good = 0;
    }

    printf("goldilocks_shared_secret ss21==ss21p...\n");
    if (memcmp(ss21,ss21p,sizeof(ss21))) {
        log_warnx("main","    Failed shared-secret precomp trial.\n");
        good = 0;
    }

    /* test derive / underive / priv to pub */
    printf("\ntest derive / underive / priv to pub...\n");
    goldilocks_underive_private_key ( proto, &priv );
    ret = goldilocks_derive_private_key ( &priv2, proto );
    if (ret || memcmp(&priv,&priv2,sizeof(priv))) {
        log_warnx("main","    Failed derive round-trip trial.\n");
        good = 0;
    }

    ret = goldilocks_private_to_public ( &pub2, &priv );
    if (ret || memcmp(&pub,&pub2,sizeof(pub))) {
        log_warnx("main","    Failed private-to-public trial.\n");
        good = 0;
    }

    goldilocks_destroy_precomputed_public_key( pre );


    if (!good){
        log_warnx("main", "Something failed");
    } else {
        printf("All test passed!\n");
    }

    return EXIT_SUCCESS;
}
