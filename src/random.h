#include <gcrypt.h>

#ifndef RANDOM_H
#define RANDOM_H

static void inline
random_bytes_long_term(void * const buf, const size_t size) {
  //TODO: GCRY_VERY_STRONG_RANDOM is blocking, need to resolve this.
#ifndef FAST_RANDOM
  gcry_randomize(buf, size, GCRY_VERY_STRONG_RANDOM);
#else
  gcry_randomize(buf, size, GCRY_STRONG_RANDOM);
#endif
}

static void inline
random_bytes_strong(void * const buf, const size_t size) {
  gcry_randomize(buf, size, GCRY_STRONG_RANDOM);
}

static void inline
random_bytes_nonce(void * const buf, const size_t size) {
  gcry_create_nonce(buf, size);
}


#endif
