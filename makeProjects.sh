#!/bin/bash


# -1- logging
cd ~/programmieren/C/logging;
make install;

# -2- jsonParser
cd ~/programmieren/C/jsonParser;
make install; 

# -2- scf / momoMath (requires gslFace)
cd ~/programmieren/C/gslFace;
make install; 
cd ~/programmieren/C/momoMath;
make install; 
cd ~/programmieren/C/sfbox/scfResource
make;



# -4- momonotes
#     ln -s makes a soft link and -f overwrites existing files
#     mkdir -p doesnt complain if directory already exists
cd ~/programmieren/momo;
cd momologging; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momologging; make install; cd ..;
cd momogui; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momogui; make install; cd ..;
cd momonotes; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momonotes; make install; cd ..;
cd momoserver; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momoserver; make install; cd ..;
cd javaservices; mvn package; cd ..;
cd cppservices; make install; cd ..;


