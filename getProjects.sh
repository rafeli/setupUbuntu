#!/bin/bash

# pull from github, 

#  # -1- set up ssh first (dont really use this yet, only for s
#  cd ~/.ssh
cd;
scp -r 'rafel@rafel-DS57U.fritz.box:/home/rafel/.ssh' .
chmod 400 .ssh/id_rsa
#  eval "$(ssh-agent -s)"
#  ssh-add ~/.ssh/id_rsa

# -1a- tell git to cache user/passwd
git config --global credential.helper cache


# -2- clone projects
cd ~/programmieren
git clone https://github.com/rafeli/momo.git

cd ~/programmieren/C
git clone https://github.com/rafeli/logging.git
git clone https://github.com/rafeli/gslFace.git
git clone https://github.com/rafeli/momoMath.git
git clone https://github.com/rafeli/jsonParser.git
git clone https://github.com/rafeli/sfbox.git
git clone https://github.com/rafeli/schuelerlabor-2.0.git

cd ~
git clone https://github.com/rafeli/myHTMLNotes.git

cd ~/Desktop
git clone git@quorra.scai.fraunhofer.de:molgenerator
