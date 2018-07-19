#!/bin/bash


# -1- logging
cd ~/programmieren/C/logging;
make install;

# -2A- momoHTTP
cd ~/programmieren/momo/momoHTTP;
make install; 

# -2B- jsonParser (abh von momoHTTP)
cd ~/programmieren/C/jsonParser;
make install; 

# -3- cpp services (abh von jsonParser)
cd ~/programmieren/momo/cppservices; 
make ; 

# -4- scf / momoMath
cd ~/programmieren/C/momoMath;
make install; 
# cd ~/programmieren/C/sfbox/scfResource
# make;
# cd ~/programmieren/C/sfbox/libfenk/trunk
# make install;
# cd ~/programmieren/C/sfbox/trunk/src
# make install;  # untested 2016-03-22, scheint ok 2016-11-12
# cd ~/programmieren/C/sfbox/sfboxService
# make install;  # untested 2016-03-22, 2016-11-12: war falsch, vielleicht jetzt OK ?



# -4- momonotes
#     ln -s makes a soft link and -f overwrites existing files
#     mkdir -p doesnt complain if directory already exists
cd ~/programmieren/momo;
cd momonotes; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momonotes; make install; cd ..;
cd momoserver; ln -sf ~/local/lib/node_modules; mkdir -p ./node_modules/momoserver; make install; cd ..;
#cppservices is required by scfResource ...
# in Ubuntu 18.04 some certificates seem to be old:
sudo rm /etc/ssl/certs/java/cacerts
sudo update-ca-certificates --fresh
cd javaservices; mvn package; cd ..;



