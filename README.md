cramershoup
=============================

a cramershoup impl with ed448

Installation
------------

Make sure you include libsodium in CFLAGS and LDFLAGS

Execute the following commands:

    $ ./autogen.sh
    $ ./configure
    $ git clone git://git.code.sf.net/p/ed448goldilocks/code src/lib/ed448
    $ make ed448
    $ make
    $ cd src && ./cramershoup -G alice -T alice

