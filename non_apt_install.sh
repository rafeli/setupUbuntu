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

# -2- OPENCV-3.0
# ubuntu opencv=2.4.8, I need 3.0 (for schuelerlabor-2.0)
cd ~/local/distributions
wget https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip -O opencv-3.0.0-alpha.zip
unzip opencv-3.0.0-alpha.zip
mkdir opencv-3.0.0-alpha/build
cd opencv-3.0.0-alpha/build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/local ..
# gibt noch ERROR und kommt nicht durch !!
#  make -j4
#  sudo make install

# -3- OPENBABEL
#     (requires libeigen2-dev)
cd ~/local/distributions
wget http://sourceforge.net/projects/openbabel/files/openbabel/2.3.2/openbabel-2.3.2.tar.gz
tar zxf openbabel-2.3.2.tar.gz
mkdir build
cd build
cmake ../openbabel-2.3.2 -DCMAKE_INSTALL_PREFIX=~/local
make -j4
make install

# BOOST will ich nicht, lieber spaceship wieder umschreiben ...

# -4- Nauty version 2.5 (Ubuntu has 2.4)
cd ~/local/distributions
wget http://pallini.di.uniroma1.it/nauty25r9.tar.gz
tar zxf nauty25r9.tar.gz
./configure
make
cp nauty1.a ../../lib
mkdir ../../include/nauty
cp *.h ../../include/nauty



