#!/bin/sh
if [ -d "libs" ]; then 
    echo "libs already setup, skipping..."
    exit 0
fi

mkdir libs
cd libs

# download zlib
wget -O zlib.tar.gz https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz
tar -xvzf zlib.tar.gz
rm zlib.tar.gz
mv zlib-1.2.11 zlib

# build zlib
cd zlib
mkdir -p dist
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX='../dist' ..
make
make install
