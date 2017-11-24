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

# -2- OPENCV-3.0 moved to slow_apt_install

# -3- OPENBABEL moved to slow_apt_install

# -4- Nauty version 2.5 (Ubuntu has 2.4)
cd ~/local/distributions
wget http://pallini.di.uniroma1.it/nauty25r9.tar.gz
tar zxf nauty25r9.tar.gz
cd nauty25r9
./configure
make
cp nauty1.a ../../lib
mkdir ../../include/nauty
cp *.h ../../include/nauty

# -5- PHANTOMJS, Ubuntu version ist kaputt: https://github.com/ariya/phantomjs/issues/14240 
cd ~/local/distributions
wget 'https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2'
bunzip2 phantomjs-2.1.1-linux-x86_64.tar.bz2 
tar xf phantomjs-2.1.1-linux-x86_64.tar
ln -s ../distributions/phantomjs-2.1.1-linux-x86_64/bin/phantomjs


# -6- OPENCL SDK von AMD
cd ~/local/distributions


# -7- V8 Engine moved to slow_apt_install
# -8- NWChem moved to slow_apt_install

# -9- Doxygen vim plugin (no ubuntu package available?) (2017-05 not tested yet)
mkdir -p ~/.vim/plugin 
wget 'http://www.vim.org/scripts/download_script.php?src_id=14064' -O ~/.vim/plugin/doxygen.vim


# -10- libint package moved to slow_apt_install

# -11- intel opencl moved to slow_apt_install

# # -12- Brave browser (faster than chrome, no popups)
# cd ~/local/distributions
# wget -O brave.deb https://laptop-updates.brave.com/latest/dev/ubuntu64
# sudo dpkg -i brave.deb

# ?? node npm: ubuntu version are too old (I need await/async)
cd ~/local/distributions
wget 'https://nodejs.org/dist/v8.9.1/node-v8.9.1-linux-x64.tar.xz'
tar xf 'node-v8.9.1-linux-x64.tar.xz'
# this is most robust since /usr/bin always on path:
cd /usr/bin  
sudo ln -s ~/local/distributions/node-v8.9.1-linux-x64/bin/npm
sudo ln -s ~/local/distributions/node-v8.9.1-linux-x64/bin/node

