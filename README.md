cramershoup
=============================

a cramershoup impl with ed448

Installation
------------

Make sure you include libsodium in CFLAGS and LDFLAGS

Execute the following commands:

    $ ./autogen.sh
    $ ./configure
    $ git clone --single-branch -b decaf --depth 1 git://git.code.sf.net/p/ed448goldilocks/code src/lib/ed448
    $ make check

