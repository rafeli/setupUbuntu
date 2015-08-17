#!/bin/bash

# -0- update registry
sudo apt-get update

# -1- GENERIC PACKAGES

# -1.0- always
sudo apt-get install -y vim
sudo apt-get install -y vim-gnome
sudo apt-get install -y git
git config --global user.name "rafel"
git config --global user.email "rafelisraels@gmail.com"
sudo apt-get install -y texlive-latex-base
sudo apt-get install -y texlive-latex-full      # chemfig, TikZ, german-lang, fonts, ...
sudo apt-get install -y google-chrome-stable
sudo apt-get install -y octave
sudo apt-get install -y hplip                   # HP Printing

# -1.1- OPTIONAL..
# sudo apt-get install nmap                     # port scanning
# sudo apt-get install openssh-server           # allows ssh logins



# -2- PROGRAMMING: COMPILER / PACKAGEMANAGER

# -2.1- NODE 
sudo apt-get install -y nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install -y npm                     # npm packages: see npm_install.sh

# -2.2- JAVA
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y maven

# -2.3- C/C++
sudo apt-get install -y doxygen
sudo apt-get install -y valgrind
sudo apt-get install -y g++
sudo apt-get install -y cmake

# -3- SPECIFIC PACKAGES
sudo apt-get install -y curl                   # http testing
sudo apt-get install -y nauty                  # graph generation
sudo apt-get install -y libtiff4-dev           # OPENCV (?)
sudo apt-get install -y openbabel              # 
sudo apt-get install -y flex                   # parser: jsonParser, ..
sudo apt-get install -y libgsl0-dev            # GSL, library 



