AM_CFLAGS = $(MORE_CFLAGS) -Iinclude
AM_CPPFLAGS = $(MORE_CPPFLAGS)
AM_LDFLAGS = $(MORE_LDFLAGS) -lsodium -Llib/ed448/build -ldecaf

check_PROGRAMS = test
lib_LTLIBRARIES = libcramershoup.la
dist_man_MANS = cramershoup.8

## TODO:5000 When you want to add more files, add them below.
## TODO:5000 Automake will find dependencies by itself. Run
## TODO:5000 ./autogen.sh after modifying this file.

libcramershoup_la_SOURCES  = cramershoup.c
libcramershoup_la_CFLAGS   = $(AM_CFLAGS)
libcramershoup_la_LDFLAGS  = $(AM_LDFLAGS)
test_SOURCES = test.c log.c
test_LDADD = libcramershoup.la
test_CFLAGS = $(AM_CFLAGS)
test_LDFLAGS = $(AM_LDFLAGS)
# cramershoup_CFLAGS   = $(AM_CFLAGS) @JANSSON_CFLAGS@
# cramershoup_LDFLAGS  = $(AM_LDFLAGS) @JANSSON_LIBS@

## TODO:2004 Each time you have used `PKG_CHECK_MODULES` macro
## TODO:2004 in `configure.ac`, you get two variables that
## TODO:2004 you can substitute like above.
