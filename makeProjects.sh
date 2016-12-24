#!/bin/bash


# -1- logging
cd ~/programmieren/C/logging;
make install;

# -2- jsonParser
cd ~/programmieren/C/jsonParser;
make install; 

# -2B- momoHTTP
cd ~/programmieren/momo/momoHTTP;
make install; 


# -3- cpp services
cd ~/programmieren/momo/cppservices; 
make ; 

# -4- scf / momoMath (requires gslFace)
cd ~/programmieren/C/gslFace;
make install; 
cd ~/programmieren/C/momoMath;
make install; 
cd ~/programmieren/C/sfbox/scfResource
make;
cd ~/programmieren/C/sfbox/libfenk/trunk
make install;
cd ~/programmieren/C/sfbox/trunk/src
make install;  # untested 2016-03-22, scheint ok 2016-11-12
cd ~/programmieren/C/sfbox/sfboxService
make install;  # untested 2016-03-22, 2016-11-12: war falsch, vielleicht jetzt OK ?



# -4- momonotes
#     ln -s makes a soft link and -f overwrites existing files
#     mkdir -p doesnt complain if directory already exists
cd ~/programmieren/momo;
cd momologging; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momologging; make install; cd ..;
cd momogui; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momogui; make install; cd ..;
cd momonotes; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momonotes; make install; cd ..;
cd momoserver; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momoserver; make install; cd ..;
#cppservices is required by scfResource ...
cd javaservices; mvn package; cd ..;



