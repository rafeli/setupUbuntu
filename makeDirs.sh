#!/bin/bash

cd ~
rmdir Pictures
rmdir Music
rmdir Documents
rmdir Public
rmdir Videos
rmdir Templates

mkdir -p ~/local/distributions
mkdir -p ~/local/lib/node_modules
cd ~
ln -sf ~/local/lib/node_modules
mkdir -p ~/local/include/momo
mkdir -p ~/local/bin

mkdir -p ~/programmieren/C
mkdir -p ~/programmieren/momo

