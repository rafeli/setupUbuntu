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
#  # gibt noch ERROR und kommt nicht durch !!
#  cd ~/local/distributions
#  wget https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip -O opencv-3.0.0-alpha.zip
#  unzip opencv-3.0.0-alpha.zip
#  mkdir opencv-3.0.0-alpha/build
#  cd opencv-3.0.0-alpha/build
#  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/local ..
#  make -j4
#  sudo make install



