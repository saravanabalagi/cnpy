#!/bin/sh
echo "starting build..."
[ $1="--clean" ] && rm -rf build

mkdir -p build
cd build
cmake ..
make
