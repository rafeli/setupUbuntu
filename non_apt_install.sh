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
#     (requires libeigen2-dev)
cd ~/local/distributions
wget http://sourceforge.net/projects/openbabel/files/openbabel/2.3.2/openbabel-2.3.2.tar.gz
tar zxf openbabel-2.3.2.tar.gz
# repair bug in openbabel-2.3.2 with gcc5, see http://forums.openbabel.org/PATCH-Fix-build-with-gcc-5-x-td4658111.html
sed "s/__GNUC__ == 4/__GNUC__ >= 4/" ./openbabel-2.3.2/include/openbabel/shared_ptr.h > qqq
mv qqq ./openbabel-2.3.2/include/openbabel/shared_ptr.h
mkdir build
cd build
cmake ../openbabel-2.3.2 -DCMAKE_INSTALL_PREFIX=../../  # prefix=~/local fails in ubuntu 16.04: must be relativ
make -j4
make install
cd ~/local/include
ln -s openbabel-2.0/openbabel # hat letztes mal nicht funktioniert ???


# -4- Nauty version 2.5 (Ubuntu has 2.4)
cd ~/local/distributions
wget http://pallini.di.uniroma1.it/nauty25r9.tar.gz
tar zxf nauty25r9.tar.gz
cd nauty25r9
# fpic required to use nauty in swig
CFLAGS=-fpic CXXFLAGS=-fpic ./configure
make
# nauty1.a is the faster lib that is limited to small graphs
cp nauty1.a ../../lib
cp nauty.a ../../lib
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


# -7- V8 Engine
cd ~/local/distributions
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=`pwd`/depot_tools:"$PATH"
gclient   # not sure if needed
fetch v8  # 5 minutes
cd v8
gclient sync # nicht sicher, ob hier sinnvoll
git checkout -b 5.8 -t branch-heads/5.8
gclient sync              # absolut erforderlich !!!
tools/dev/v8gen.py x64.release

#noch von Hand durchzufuehren:
#   # ggf in neuem shell Wiederholen:
#   # cd ~/local/distributions
#   # export PATH=`pwd`/depot_tools:"$PATH"
#   # cd v8
# gn args out.gn/x64.release
#      *** dabei oeffnet sich gvim und es muessen folgende Zeilen hinzugefuegt werden:
#     is_component_build = false
#     v8_static_library = true
# und dann:
# ninja -C out.gn/x64.release/  # dauert: ~10 Minuten auf 8400, 20 auf 6200?



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

