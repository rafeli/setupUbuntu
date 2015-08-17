#!/bin/bash

# -0- update registry
sudo apt-get update

# -1- GENERIC PACKAGES

# -1.0- always
sudo apt-get purge -y vim
sudo apt-get purge -y vim-gnome
sudo apt-get purge -y git

sudo apt-get purge -y texlive-lang-german         # depends on texlive-base
sudo apt-get purge -y texlive-fonts-recommended   # includes gyre fonts, not cm-super??
sudo apt-get purge -y texlive-pictures            # tikZ, chemfig
sudo apt-get purge -y texlive-latex-recommended   # l3, koma-script, 

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
sudo apt-get purge -y libjs-jquery             # jquery to be included in pages
sudo apt-get purge -y libjs-jquery-ui          # jquery-ui

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


