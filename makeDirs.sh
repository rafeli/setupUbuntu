#!/bin/bash

cd ~
rmdir Pictures
rmdir Music
rmdir Documents
rmdir Public
rmdir Videos
rm -rf Templates

mkdir -p ~/local/distributions
mkdir -p ~/local/lib/node_modules
mkdir -p ~/local/lib/python_modules
cd ~
ln -sf ~/local/lib/node_modules
mkdir -p ~/local/include/momo
mkdir -p ~/local/bin

mkdir -p ~/programmieren/C
mkdir -p ~/programmieren/java
mkdir -p ~/programmieren/python

