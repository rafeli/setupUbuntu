#!/bin/bash

# pull from github, 

#  # -1- set up ssh first (dont really use this yet, only for s
#  cd ~/.ssh
# cd;
# scp -r 'rafel@server.local:/home/rafel/.ssh' .
# !!! SCP doesnt seem to work !!!
# chmod 400 .ssh/id_rsa
#  eval "$(ssh-agent -s)"
#  ssh-add ~/.ssh/id_rsa
cd

# -1a- tell git to cache user/passwd
git config --global credential.helper cache

# -2- clone projects
# momo
cd
git clone https://github.com/rafeli/momoExport.git

cd ~/programmieren
git clone https://github.com/rafeli/momo.git
cd ~/programmieren/momo
ln -sf ~/local/lib/node_modules

cd ~/programmieren/java
git clone https://bitbucket.org/rafeli/momoData.git

cd ~/programmieren/C
git clone https://github.com/rafeli/logging.git
git clone https://github.com/rafeli/math.git
git clone https://github.com/rafeli/chem.git
git clone https://github.com/rafeli/momoCL.git
git clone https://github.com/rafeli/momoImg.git
git clone https://github.com/rafeli/jsonParser.git
git clone https://github.com/rafeli/molgen.git
# git clone https://github.com/rafeli/murat.git
git clone https://bitbucket.org/rafeli/tools.git

cd ~
git clone https://github.com/rafeli/myHTMLNotes.git

# need to see how I can activate ssh-key first
# cd ~/Desktop
# OLD NO LONGER VALID: git clone git@quorra.scai.fraunhofer.de:molgenerator
# git clone git@quorra.scai.fraunhofer.de:molGenerator.git
# git clone git@quorra.scai.fraunhofer.de:israels-work.git

