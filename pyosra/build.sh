#!/bin/env bash

./configure --prefix=$PREFIX \
    --with-gocr-include=$PREFIX/include/gocr \
    --with-gocr-lib=$PREFIX/lib \
    --with-openbabel-include=$PREFIX/include/openbabel-2.0 \
    --with-openbabel-lib=$PREFIX/lib \
    --with-graphicsmagick-include=$PREFIX/include \
    --with-graphicsmagick-lib=$PREFIX/lib \
    --with-tesseract \
    --with-tesseract-include=$PREFIX/include/tesseract \
    --with-tesseract-lib=$PREFIX/lib \
    --enable-lib\
    CXXFLAGS="$CXXFLAGS -Wno-c++11-narrowing"
make
make install
$CXX -std=c++17 -O3 -Wall -shared -fPIC -I$PREFIX/include -I$PREFIX/include/python3.6m -I$PREFIX/include/GraphicsMagick -I$PREFIX/include/openbabel-2.0 -I$PREFIX/include/gocr "$SRC_DIR/src/osra_rgroup.cpp" -o "$SP_DIR/osra_rgroup`python3-config --extension-suffix`" $LD_RUN_PATH/libosra.a -lGraphicsMagick -lGraphicsMagick++ -lopenbabel -ltesseract -lpoppler-cpp -lpoppler -lfontconfig -lfreetype -lpthread -locrad -lpotrace -lm -lPgm2asc -L$LD_RUN_PATH

