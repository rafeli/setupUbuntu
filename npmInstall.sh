#!/bin/bash

# prevent npm from deleting packages
npm config set package-lock false

# -2.1- NPM INSTALL
cd ~/local/lib
npm install browserify        # all browser modules
npm install eslint                    # parsing js-code
npm install jsdoc             # documentation of js-projects


 #npm install sha3                # see: https://codahale.com/how-to-safely-store-a-password/
 npm install bcryptjs             # extServer
 npm install @hapi/b64                  # base64 as streamfilter ?
 npm install string-hash          # used in momonotes/latex
 npm install utf8                 # used in momonotes/latex
 npm install xmlhttprequest       # used in momonotes/testData
 npm install three                # WEB-GL wrapper, used in molCompare.js
# selber implementiert  npm install rimraf               # implements recursive dir-removal, used in grouperServer.js
# std funktion im Browser  npm install pikaday              # calender allowing user to select date, used in eopti/simulation
# 20190926 cd ~/local/lib/node_modules/three
# ln -s build/three.min.js          # momonotes expects to find three.min.js in three/



