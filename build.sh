#!/bin/sh
sh setup.sh

[ $1="--clean" ] && rm -rf build

echo "starting build..."
mkdir -p dist build
cd build
cmake -DCMAKE_INSTALL_PREFIX="../dist" ..
make
make install
cd -

cd example 
sh build.sh


