#!/bin/bash


# -2.1- NPM INSTALL  (TODO: ueberlegen node ohne sudo installieren, dann auch diese...)
cd ~/local/lib
sudo npm install -g browserify        # all browser modules
sudo npm install -g jslint            #
sudo npm install express                   # momoserver
# npm install groc                    # ??
# npm install cssify                  # include css into bundle ?
sudo npm install request                   # extServer
sudo npm install body-parser               # momoserver
# npm install ejs                     # ??
# npm install css                     # ??
sudo npm install jison                   # js-based bison-like parser
# npm install xmldom                  # create svg outside browser
# npm install xmlserializer           # create svg outside browser
sudo npm install atob                      # base64 encoding
sudo npm install underscore           # e.g. for momonotes
sudo npm install string-hash          # used in momonotes/latex

sudo npm install three                # WEB-GL wrapper, used in molCompare.js
cd ~/local/lib/node_modules/three
ln -s build/three.min.js              # momonotes expects to find three.min.js in three/

# follow needed to include with $.getScript() 
cd ~/local/lib/node_modules/three
sed "s/'use strict'//" three.min.js > qqq.js  # delete 'use strict' to use in $getscript()
mv qqq.js three.min.js                        # should be an easier way to this, but it works ...


# the npm jquery doesnt seem to work in momonotes !!
# npm install jquery                  # ??

