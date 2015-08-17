#!/bin/bash


# -1- BISON
# sudo apt-get install -y bison       # jsonParser
# ubuntu bison= 3.0.2 I need 3.0.4
cd ~/local/distributions
ftp -in ftp.gnu.org << SCRIPTEND
user anonymous test
binary
cd gnu/bison
get bison-3.0.4.tar.gz
SCRIPTEND
tar xf bison-3.0.4.tar.gz
cd bison-3.0.4
./configure && make && sudo make install


