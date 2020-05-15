#!/bin/bash

# -0- update registry (also see http://www.tecmint.com/install-google-chrome-in-debian-ubuntu-linux-mint/)
# auskommentiert auf Verdacht am 14.2.2019
# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update

# -1- GENERIC PACKAGES

# -1.0- always
sudo apt-get install -y vim
sudo apt-get install -y vim-gtk3
cp vimrc ~/.vimrc
sudo apt-get install -y gedit
sudo apt-get install -y pdftk
sudo apt-get install -y chromium-browser

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

# moved to non-apt: sudo apt-get install -y google-chrome-stable    # also see above (update registry)
sudo apt-get install -y octave
sudo apt-get install -y r-base-core
sudo apt-get install -y hplip                   # HP Printing
sudo apt-get install -y nfs-common              # mount server-disks
sudo apt-get install -y gnumeric                # preferred to libreoffice, also with ssconvert

# -1.1- OPTIONAL..
# sudo apt-get install nmap                     # port scanning
# sudo apt-get install openssh-server           # allows ssh logins
# sudo apt-get install -y inkscape              # draw svg-images
# sudo apt-get install -y cheese                # (usb) camera
# sudo apt-get install -y tnef                  # winmail.dat Dateien extrahieren



# -2- PROGRAMMING: COMPILER / PACKAGEMANAGER

# -2.1- NODE / JS

# node / npm now in non-apt install
# sudo apt-get install -y nodejs
# sudo ln -sf /usr/bin/nodejs /usr/bin/node 
sudo apt-get install -y npm                   # npm packages: see npm_install.sh
sudo npm install -g n                         # version manager vor node/npm
sudo n stable                                 # gets the latest stable version of node
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node 
sudo ln -sf /usr/local/bin/node /usr/bin/node  # not clear if and why needed
sudo ln -sf /usr/local/bin/npm /usr/bin/npm    # same ..

# -2.2- JAVA
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y maven
# ubuntu version too old, doesnt hanlde maven
# sudo apt-get install -y eclipse-platform
sudo apt-get install -y graphviz              # using doxygen (eclox) in eclipse

# -2.3- C/C++
sudo apt-get install -y doxygen
sudo apt-get install -y valgrind
sudo apt-get install -y g++
sudo apt-get install -y cmake                  # also for opencv-3.0

# -2.4- python
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-tk             # "tinker" for matplotlib

# -3- SPECIFIC PACKAGES
sudo apt-get install -y curl                   # http testing
sudo apt-get install -y libeigen2-dev          # lin Algebra, required vor openbabel
sudo apt-get install -y libeigen3-dev          # lin Algebra, required vor valeev/libint uses
sudo apt-get install -y flex                   # parser: jsonParser, ..
sudo apt-get install -y libgsl0-dev            # GSL, library 
sudo apt-get install -y libopencv-dev          # opencv
# sudo apt-get install -y  build-essential       # was for for opencv-3.0 ?????? 
# sudo apt-get install -y  libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev # was for opencv-3.0
sudo apt-get install -y nauty                  # geng/nauty: generate graphs, required for molgenerator
sudo apt-get install -y libnauty2-dev          # include files, required for molgenerator
sudo apt-get install -y python-dev libopenblas-dev libopenmpi-dev tcsh  # NWCHEM, already installed dpdcies: gfortran, openmpi-bin, make
sudo apt-get install -y librapidxml-dev        # reading/writing xml from C++
#  sudo apt-get install -y libgmp-dev             # multiprecision development, required for valeev/libint
#  sudo apt-get install -y libboost-dev           # also for valeev/libint
sudo apt-get install -y clinfo                 # zur Programmierung in opencl
sudo apt-get install -y mesa-common-dev        # zur Programmierung in opencl (und opengl?)
# sudo apt-get install -y libglu1-mesa-dev        # zur Programmierung in opengl  ?
sudo apt-get install -y cpufrequtils              # erlaubt cpufreq-info;  sudo cpufreq-set -c 0 -u 2.8Ghz 
sudo apt-get install -y openbabel
sudo apt-get install -y libopenbabel-dev
sudo apt-get install -y phantomjs





