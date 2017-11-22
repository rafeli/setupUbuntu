#!/bin/bash

# -0- update registry (also see http://www.tecmint.com/install-google-chrome-in-debian-ubuntu-linux-mint/)
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update

# -1- GENERIC PACKAGES

# -1.0- always
sudo apt-get install -y vim
sudo apt-get install -y vim-gnome
sudo apt-get install -y gedit
sudo apt-get install -y pdftk

sudo apt-get install -y git
git config --global user.name "rafel"
git config --global user.email "rafelisraels@gmail.com"

sudo apt-get install -y nfs-kernel-server              # use nfs as client
sudo apt-get install -y openssh-server                 # 

# texlive-full ~ 3 Gigabyte
sudo apt-get install -y texlive-lang-german         # depends on texlive-base
sudo apt-get install -y texlive-fonts-recommended   # includes gyre fonts, not cm-super??
sudo apt-get install -y texlive-pictures            # tikZ, chemfig
sudo apt-get install -y texlive-latex-recommended   # l3, koma-script, 
sudo apt-get install -y texlive-science             # mhchem
sudo apt-get install -y texlive-latex-extra         # achemso
sudo apt-get install -y preview-latex-style         # preview (required for momoNotes)
sudo apt-get install -y imagemagick                 # convert (required for momoNotes)

sudo apt-get install -y google-chrome-stable    # also see above (update registry)
sudo apt-get install -y octave
sudo apt-get install -y r-base-core
sudo apt-get install -y hplip                   # HP Printing
sudo apt-get install -y nfs-common              # mount server-disks

# -1.1- OPTIONAL..
# sudo apt-get install nmap                     # port scanning
# sudo apt-get install openssh-server           # allows ssh logins
sudo apt-get install -y inkscape                # draw svg-images



# -2- PROGRAMMING: COMPILER / PACKAGEMANAGER

# -2.1- NODE / JS

# node / npm now in non-apt install
# sudo apt-get install -y nodejs
# sudo ln -sf /usr/bin/nodejs /usr/bin/node
# sudo apt-get install -y npm                   # npm packages: see npm_install.sh

sudo apt-get install -y libjs-jquery             # jquery to be included in pages
sudo apt-get install -y libjs-jquery-ui          # jquery-ui
# phantomjs installed in non-apt install
# sudo apt-get install -y phantomjs             # u.a. fuer schuelerlabor svg->png
# cd ~/local/bin
# sudo ln -sf /usr/bin/phantomjs                # this is where schuelerlabor expects it

# 2016-06-24: tried to move to npm install, didnt work ...
# but did move them from ~/local/lib to node_modules
cd ~/local/lib/node_modules; 
ln -sf /usr/share/javascript/jquery            # node_modules is where momonotes looks for jquery
ln -sf /usr/share/javascript/jquery-ui         # ... and for jquery-ui
cd ~/local/lib/node_modules/jquery-ui;
sudo ln -sf css/smoothness/jquery-ui.min.css  # ... and jquery-ui/jquery-ui.min.css
sudo ln -sf css/smoothness/images             # ... and jquery-ui/images/...

# -2.2- JAVA
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y maven
# downloading the actual version is much faster the
# the UBUNTU version is old, e.g. doesnt import from maven
# sudo apt-get install -y eclipse

# -2.3- C/C++
sudo apt-get install -y doxygen
sudo apt-get install -y valgrind
sudo apt-get install -y g++
sudo apt-get install -y cmake                  # also for opencv-3.0

# -3- SPECIFIC PACKAGES
sudo apt-get install -y curl                   # http testing
sudo apt-get install -y libeigen2-dev          # lin Algebra, required vor openbabel
sudo apt-get install -y libeigen3-dev          # lin Algebra, required vor valeev/libint uses
sudo apt-get install -y libtiff4-dev           # OPENCV (?)
sudo apt-get install -y flex                   # parser: jsonParser, ..
sudo apt-get install -y libgsl0-dev            # GSL, library 
sudo apt-get install -y  build-essential       # required for opencv-3.0 ?????? 
sudo apt-get install -y  libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev # required for opencv-3.0
sudo apt-get install -y nauty                  # geng/nauty: generate graphs, required for molgenerator
sudo apt-get install -y python-dev libopenblas-dev libopenmpi-dev tcsh  # NWCHEM, already installed dpdcies: gfortran, openmpi-bin, make
sudo apt-get install -y librapidxml-dev        # reading/writing xml from C++
#  sudo apt-get install -y libgmp-dev             # multiprecision development, required for valeev/libint
#  sudo apt-get install -y libboost-dev           # also for valeev/libint
sudo apt-get install -y clinfo                 # zur Programmierung in opencl
sudo apt-get install -y mesa-common-dev        # zur Programmierung in opencl (und opengl?)
# sudo apt-get install -y libglu1-mesa-dev        # zur Programmierung in opengl  ?




