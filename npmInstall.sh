#!/bin/bash


# -2.1- NPM INSTALL
cd ~/local/lib
npm install browserify        # all browser modules
npm install eslint                    # parsing js-code
npm install jsdoc             # documentation of js-projects


 #npm install sha3                      # see: https://codahale.com/how-to-safely-store-a-password/
 npm install bcrypt                      # extServer
# npm install jison                   # js-based bison-like parser
# npm install xmldom                  # create svg outside browser
# npm install xmlserializer           # create svg outside browser
# npm install atob                      # base64 encoding
 npm install b64                  # base64 as streamfilter ?
# npm install underscore           # e.g. for momonotes
 npm install string-hash          # used in momonotes/latex
 npm install utf8                 # used in momonotes/latex
 npm install xmlhttprequest       # usdin in momonotes/ajax


 npm install three                # WEB-GL wrapper, used in molCompare.js
cd ~/local/lib/node_modules/three
ln -s build/three.min.js              # momonotes expects to find three.min.js in three/



