cramershoup
=============================

a cramershoup impl with ed448

Installation
------------

Make sure you have libsodium and libdecaf installed

Execute the following commands:

    $ ./autogen.sh
    $ ./configure CFLAGS="-DFAST_RANDOM" #This CFLAG is for fast test only, when entropy is collected too slow.
    $ make check
    $ make install
