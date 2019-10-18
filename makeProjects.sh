#!/bin/bash

# -1- logging
cd ~/programmieren/C/logging;
make install;

# -2A- tools (was: momoHTTP)
cd ~/programmieren/C/tools;
make install; 

# -2B- jsonParser (abh von momoHTTP)
cd ~/programmieren/C/jsonParser;
make install; 

# -4- scf / math
cd ~/programmieren/C/math;
make install; 

# molgen 
cd ~/programmieren/C/molgen
mkdir lib
mkdir include
cd include
ln -s ~/local/include/momo/
cd ../lib
ln -s ~/local/lib/libmomoTools.a
ln -s ~/local/lib/libmomoHTTP.a
cd ../testTools; make
cd ../molStructure; make -j4
cd ../tools; make
cd ../graph2smiles; make

# chem
cd ~/programmieren/C/chem
ln -s ../molgen/lib/
mkdir include
cd include
ln -s ../../molgen/include molGenerator
cd ~/programmieren/C/chem
make

# -4- momonotes
#     ln -s makes a soft link and -f overwrites existing files
#     mkdir -p doesnt complain if directory already exists
cd ~/programmieren/momo;
cd momonotes; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momonotes; make install; cd ..;
cd momoserver; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momoserver; make install; cd ..;
cd momoserver; ln -s ~/local/distributions/Anaconda3/bin/python3 python; cd ..; # see momoserver.js
cd cppservices; make install ; cd ..;
cd logging; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momo; make install ; cd ..;
cd apps/test; make; cd ../..;
#cppservices is required by scfResource ...

# java/momodata
# in Ubuntu 18.04 some certificates seem to be old:
# sudo rm /etc/ssl/certs/java/cacerts
sudo update-ca-certificates --fresh
cd ~/programmieren/java/momodata; mvn package; cd ..;
cd ~/local/lib
ln -s ~/programmieren/java/momodata/javalibs

# python/pythonTools
cd ~/programmieren/python/pythonTools
ln -s ~/local/lib/python_modules
mkdir -p python_modules/momotools
make install




