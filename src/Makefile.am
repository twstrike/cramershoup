AM_CFLAGS = $(MORE_CFLAGS) -Iinclude
AM_CPPFLAGS = $(MORE_CPPFLAGS)
AM_LDFLAGS = $(MORE_LDFLAGS) -Llib/ed448/build -ldecaf

check_PROGRAMS = test
lib_LTLIBRARIES = libcramershoup.la
dist_man_MANS = cramershoup.8

## TODO:5000 When you want to add more files, add them below.
## TODO:5000 Automake will find dependencies by itself. Run
## TODO:5000 ./autogen.sh after modifying this file.

libcramershoup_la_SOURCES  = cramershoup.c
libcramershoup_la_CFLAGS   = $(AM_CFLAGS) @LIBSODIUM_CFLAGS@
libcramershoup_la_LDFLAGS  = $(AM_LDFLAGS) @LIBSODIUM_LIBS@
test_SOURCES = test.c log.c
test_LDADD = libcramershoup.la
test_CFLAGS = $(AM_CFLAGS) @LIBSODIUM_CFLAGS@
test_LDFLAGS = $(AM_LDFLAGS) @LIBSODIUM_LIBS@
