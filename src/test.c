#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <getopt.h>
#include <libdecaf/decaf_crypto.h>
#include "random.h"
#include "cramershoup.h"
#include "log.h"

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
    fprintf(stderr, " -g, --generator    find generator\n");
    fprintf(stderr, " -G, --keygen       generate a keypair\n");
    fprintf(stderr, " -E, --enc          encrypt\n");
    fprintf(stderr, " -D, --dec          decrypt\n");
    fprintf(stderr, " -T, --test         end to end test\n");
    fprintf(stderr, "\n");
    fprintf(stderr, "see manual page " PACKAGE "(8) for more information\n");
}

void
print_point(const decaf_448_point_t p, const char* label)
{
    printf("%s :", label);
    printf("\n");
    int i;
    for (i = 0; i < DECAF_448_LIMBS; i++){
        decaf_word_t w = p->x->limb[i];
        printf("0x%016llx,", w);
    }
    printf("\n");
    for (i = 0; i < DECAF_448_LIMBS; i++){
        decaf_word_t w = p->y->limb[i];
        printf("0x%016llx,", w);
    }
    printf("\n");
    for (i = 0; i < DECAF_448_LIMBS; i++){
        decaf_word_t w = p->z->limb[i];
        printf("0x%016llx,", w);
    }
    printf("\n");
    for (i = 0; i < DECAF_448_LIMBS; i++){
        decaf_word_t w = p->t->limb[i];
        printf("0x%016llx,", w);
    }
    printf("\n");
}

void
find_generator()
{
	decaf_448_point_t p;
	unsigned char seed[DECAF_448_SER_BYTES+8];
	const char *magic = "decaf_448_g2";
	unsigned char encoded_point[DECAF_448_SER_BYTES],
	encoded_base[DECAF_448_SER_BYTES],
	hashed_base[DECAF_448_SER_BYTES];

	decaf_448_point_encode(encoded_base, decaf_448_point_base);

	//hash the base point
	keccak_sponge_t sponge;
	shake256_init(sponge);
	shake256_update(sponge, (const unsigned char *)encoded_base, sizeof(encoded_base));
	shake256_final(sponge, hashed_base, sizeof(hashed_base));

	unsigned char hint;

	//the seed
	keccak_sponge_t magic_sponge;
	shake256_init(magic_sponge);
	shake256_update(magic_sponge, (const unsigned char *)magic, strlen(magic));
	shake256_final(magic_sponge, seed, sizeof(seed));
	shake256_destroy(magic_sponge);

	// random_bytes(seed,sizeof(seed))
	shake256_init(sponge);
	shake256_update(sponge, (const unsigned char *)magic, strlen(magic));
	shake256_update(sponge, (const unsigned char *)hashed_base, sizeof(hashed_base));
	shake256_update(sponge, (const unsigned char *)seed, sizeof(seed));
	shake256_final(sponge, encoded_point, sizeof(encoded_point));
	shake256_destroy(sponge);

	//elligator
	hint = decaf_448_point_from_hash_uniform(p, encoded_point);
	printf("hint n:%#x\n", hint);

	print_point(p,"g2 found");
}

char *
sprint_encoded_scalar(decaf_448_scalar_t s)
{
    char *buf;
    buf = malloc(sizeof(char)*DECAF_448_SCALAR_BYTES*2);
    unsigned char ser[DECAF_448_SCALAR_BYTES];
    decaf_448_scalar_encode(ser,s);
    int i;
    for (i = 0; i < DECAF_448_SCALAR_BYTES; i++){
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
    int i;
    for (i = 0; i < DECAF_448_SER_BYTES; i++){
        sprintf(&buf[i*2], "%02x", (uint8_t) ser[i]);
    }
    return buf;
}

void
save_key(FILE *file, cramershoup_448_private_key_t *priv, cramershoup_448_public_key_t *pub)
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
parse_key_file(cramershoup_448_private_key_t *priv, cramershoup_448_public_key_t *pub, FILE* file)
{
    if(!file){
        fatal("parse_key_file", "file read failure\n");
    }
    decaf_bool_t valid;
    size_t size;
    unsigned char buffer[DECAF_448_SCALAR_BYTES];

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->x1, (const unsigned char *)buffer);
    if (!valid || size != DECAF_448_SCALAR_BYTES){
        fatal("parse_key_file", "x1 decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->x2, (const unsigned char *)buffer);
    if (!valid || size != DECAF_448_SCALAR_BYTES){
        fatal("parse_key_file", "x2 decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->y1, (const unsigned char *)buffer);
    if (!valid || size != DECAF_448_SCALAR_BYTES){
        fatal("parse_key_file", "y1 decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->y2, (const unsigned char *)buffer);
    if (!valid || size != DECAF_448_SCALAR_BYTES){
        fatal("parse_key_file", "y2 decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SCALAR_BYTES, file);
    valid = decaf_448_scalar_decode(priv->z , (const unsigned char *)buffer);
    if (!valid || size != DECAF_448_SCALAR_BYTES){
        fatal("parse_key_file", "z decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->c, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid || size != DECAF_448_SER_BYTES){
        fatal("parse_key_file", "c decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->d, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid || size != DECAF_448_SER_BYTES){
        fatal("parse_key_file", "d decode failure\n");
    }

    size = fread(buffer, sizeof(unsigned char), DECAF_448_SER_BYTES, file);
    valid = decaf_448_point_decode(pub->h, (const unsigned char *)buffer, DECAF_FALSE);
    if (!valid || size != DECAF_448_SER_BYTES){
        fatal("parse_key_file", "h decode failure\n");
    }
}

// TODO: need a better way to do this in test
void
test_random_scalar(decaf_448_scalar_t secret_scalar)
{
    decaf_448_symmetric_key_t proto;
    random_bytes_strong(proto,sizeof(proto));

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
                find_generator();
                exit(1);
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
        cramershoup_448_private_key_t private_key;
        cramershoup_448_public_key_t public_key;
        cramershoup_448_derive_keys(&private_key, &public_key);

        cramershoup_448_public_key_t another_public_key;
        cramershoup_448_public_key_copy(&another_public_key, &public_key);

        FILE *fp = fopen(globalArgs.keyFileName, "w"); // Open file for writing
        save_key(fp, &private_key, &public_key);
        fclose(fp);
    }

    if (end_to_end)
    {
        printf("TESTING cramershoup_448 BEGIN\n");
        FILE *fp = fopen(globalArgs.keyFileName, "r"); // Open file for reading
        cramershoup_448_private_key_t private_key;
        cramershoup_448_public_key_t public_key;
        parse_key_file(&private_key, &public_key, fp);
        fclose(fp);

        cramershoup_448_symmetric_key_t symmetric_key;
        cramershoup_448_encrypted_key_t encrypted_key;

        printf("symmetric_key: \n");
        cramershoup_448_random_symmetric_key(symmetric_key);
        int i;
        for (i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", symmetric_key[i]);
        }
        printf("\n");
        cramershoup_448_enc(encrypted_key, symmetric_key, &public_key);
        printf("encrypted_key:\n");
        int j;
        for (j = 0; j < 4; j++){
            for (i = 0; i < DECAF_448_SER_BYTES; i++){
                printf("%02x", encrypted_key[i+DECAF_448_SER_BYTES*j]);
            }
            printf("\n");
        }

        cramershoup_448_symmetric_key_t decrypted;
        cramershoup_448_dec(decrypted, encrypted_key, &private_key);
        printf("decrypted: \n");
        for (i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", decrypted[i]);
        }
        printf("\n");
        printf("TESTING cramershoup_448 END\n");
    }

    if (end_to_end)
    {
        printf("TESTING DR_cramershoup_448 BEGIN\n");
        cramershoup_448_private_key_t priv1, priv2;
        cramershoup_448_public_key_t pub1, pub2;
        cramershoup_448_derive_keys(&priv1, &pub1);
        cramershoup_448_derive_keys(&priv2, &pub2);

        cramershoup_448_symmetric_key_t symmetric_key;
        cramershoup_448_dr_encrypted_key_t encrypted_key;

        printf("symmetric_key: \n");
        cramershoup_448_random_symmetric_key(symmetric_key);
        int i;
        for (i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", symmetric_key[i]);
        }
        printf("\n");
        dr_cramershoup_448_enc(encrypted_key, symmetric_key, &pub1, &pub2);
        printf("encrypted_key:\n");
        int j;
        for (j = 0; j < 11; j++){
            for (i = 0; i < DECAF_448_SER_BYTES; i++){
                printf("%02x", encrypted_key[i+DECAF_448_SER_BYTES*j]);
            }
            printf("\n");
        }

        cramershoup_448_symmetric_key_t decrypted;
        dr_cramershoup_448_dec(decrypted, encrypted_key, &pub1, &pub2, &priv1, 1);
        printf("decrypted: \n");
        for (i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", decrypted[i]);
        }
        printf("\n");
        dr_cramershoup_448_dec(decrypted, encrypted_key, &pub1, &pub2, &priv2, 2);
        printf("decrypted: \n");
        for (i = 0; i < DECAF_448_SER_BYTES; i++){
            printf("%02x", decrypted[i]);
        }
        printf("\n");
        printf("TESTING DR_cramershoup_448 END\n");
    }

    if (end_to_end)
    {
        printf("TESTING ROM_auth_448 BEGIN\n");
        decaf_448_scalar_t s1, s2, s3;
        decaf_448_point_t p1, p2, p3;
        test_random_scalar(s1);
        test_random_scalar(s2);
        test_random_scalar(s3);
        decaf_448_point_scalarmul(p1, decaf_448_point_base, s1);
        decaf_448_point_scalarmul(p2, decaf_448_point_base, s2);
        decaf_448_point_scalarmul(p3, decaf_448_point_base, s3);

        cramershoup_448_rs_auth_t sigma, sigma_invalid;
        const char *m = "message to authenticate";

        rs_448_auth(sigma, m, s1, p1, p2, p3);
        int err = rs_448_verify(sigma, m, p1, p2, p3);
        if (err){
            fatal("verify sigma", "ring signature invalid\n");
        }
        int i,j;
        printf("sigma:\n");
        for (j = 0; j < 6; j++){
            for (i = 0; i < DECAF_448_SCALAR_BYTES; i++){
                printf("%02x", sigma[i+DECAF_448_SCALAR_BYTES*j]);
            }
            printf("\n");
        }
        rs_448_auth(sigma_invalid, m, s1, p2, p2, p3);
        err = rs_448_verify(sigma_invalid, m, p1, p2, p3);
        if (!err){
            fatal("verify sigma", "ring signature valid\n");
        }
        printf("TESTING ROM_auth_448 END\n");
    }

    return EXIT_SUCCESS;
}
