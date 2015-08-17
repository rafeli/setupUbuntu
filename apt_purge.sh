#!/bin/bash

# -0- update registry
sudo apt-get update

# -1- GENERIC PACKAGES

# -1.0- always
sudo apt-get purge -y vim
sudo apt-get purge -y vim-gnome
sudo apt-get purge -y git
sudo apt-get purge -y texlive-latex-base
sudo apt-get purge -y texlive-latex-full      # chemfig, TikZ, german-lang, fonts, ...
sudo apt-get purge -y google-chrome-stable
sudo apt-get purge -y octave
sudo apt-get purge -y hplip                   # HP Printing
sudo apt-get autoremove -y

# -1.1- OPTIONAL..
# sudo apt-get purge nmap                     # port scanning
# sudo apt-get purge openssh-server           # allows ssh logins



# -2- PROGRAMMING: COMPILER / PACKAGEMANAGER

# -2.1- NODE 
sudo apt-get purge -y nodejs
sudo apt-get purge -y npm                     # npm packages: see npm_install.sh

# -2.2- JAVA
sudo apt-get purge -y openjdk-7-jdk
sudo apt-get purge -y maven

# -2.3- C/C++
sudo apt-get purge -y doxygen
sudo apt-get purge -y valgrind
sudo apt-get purge -y g++
sudo apt-get purge -y cmake

# -3- SPECIFIC PACKAGES
sudo apt-get purge -y curl                   # http testing
sudo apt-get purge -y nauty                  # graph generation
sudo apt-get purge -y libtiff4-dev           # OPENCV (?)
sudo apt-get purge -y openbabel              # 
sudo apt-get purge -y flex                   # parser: jsonParser, ..
sudo apt-get purge -y libgsl0-dev            # GSL, library 

sudo apt-get autoremove -y


