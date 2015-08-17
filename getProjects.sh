#!/bin/bash

# pull from github, 

# -1- set up ssh first
cd ~/.ssh
scp 'rafel@rafel-DS57U.fritz.box/.ssh/id_rsa.pub' .
scp 'rafel@rafel-DS57U.fritz.box/.ssh/id_rsa' .
chmod 400 id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa


# -2- clone projects
cd ~/programmieren
git clone https://github.com/rafeli/momo.git

cd ~/programmieren/C
git clone https://github.com/rafeli/logging.git
git clone https://github.com/rafeli/gslFace.git
git clone https://github.com/rafeli/momoMath.git
git clone https://github.com/rafeli/jsonParser.git
git clone https://github.com/rafeli/sfbox.git

cd ~
git clone https://github.com/rafeli/myHTMLNotes.git

