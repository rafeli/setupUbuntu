#!/bin/bash


# -2.1- NPM INSTALL
cd ~/local/lib
npm install browserify        # all browser modules
npm install jslint            # parsing js-code
npm install jsdoc             # documentation of js-projects

 npm install express                   # momoserver
 npm install request                   # extServer
 npm install body-parser               # momoserver
 npm install jison                   # js-based bison-like parser
# npm install xmldom                  # create svg outside browser
# npm install xmlserializer           # create svg outside browser
 npm install atob                      # base64 encoding
 npm install underscore           # e.g. for momonotes
 npm install string-hash          # used in momonotes/latex
 npm install utf8                 # used in momonotes/latex

 npm install three                # WEB-GL wrapper, used in molCompare.js
cd ~/local/lib/node_modules/three
ln -s build/three.min.js              # momonotes expects to find three.min.js in three/

# follow needed to include with $.getScript() 
cd ~/local/lib/node_modules/three
sed "s/'use strict'//" three.min.js > qqq.js  # delete 'use strict' to use in $getscript()
mv qqq.js three.min.js                        # should be an easier way to this, but it works ...


# the npm jquery doesnt seem to work in momonotes !!
# npm install jquery                  # ??

