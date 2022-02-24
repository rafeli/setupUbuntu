#!/bin/bash


#   #  conda
#   cd ~/local/distributions
#   wget 'https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh' # 07.04: auf P520 die Version 2020.02 geladen
#   chmod 775 'Anaconda3-2019.07-Linux-x86_64.sh'
#   # funktioniert nicht !!! cat ~/setupUbuntu/inputInstallAnaconda.txt | ./Anaconda3-2019.07-Linux-x86_64.sh -
#   # statt dessen einfach ausfuehren, lizenz und installdir akzeptieren, init ablehnen

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# chrome, from: https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04/
cd ~/local/distributions
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb



# # -4- Nauty version 2.5 (Ubuntu has 2.4) 2019: already installed in Ubuntu
# cd ~/local/distributions
# wget http://pallini.di.uniroma1.it/nauty25r9.tar.gz
# tar zxf nauty25r9.tar.gz
# cd nauty25r9
# # fpic required to use nauty in swig
# CFLAGS=-fpic CXXFLAGS=-fpic ./configure
# make
# # nauty1.a is the faster lib that is limited to small graphs
# cp nauty1.a ../../lib
# cp nauty.a ../../lib
# mkdir ../../include/nauty
# cp *.h ../../include/nauty

# # -5- PHANTOMJS, Ubuntu version ist kaputt: https://github.com/ariya/phantomjs/issues/14240 
# cd ~/local/distributions
# wget 'https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2'
# bunzip2 phantomjs-2.1.1-linux-x86_64.tar.bz2 
# tar xf phantomjs-2.1.1-linux-x86_64.tar
# ln -s ../distributions/phantomjs-2.1.1-linux-x86_64/bin/phantomjs


# -6- OPENCL SDK von AMD
cd ~/local/distributions

#    #  # -7- V8 Engine
#    cd ~/local/distributions
#    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
#    export PATH=$PATH:/home/rafel/local/distributions/depot_tools/
#    gclient         # less than a minute
#    mkdir v8
#    cd v8
#    fetch v8        # 3 - 5  minutes 
#    cd v8
#    gclient sync
#    ./tools/dev/v8gen.py x64.release.sample
#    ninja -C out.gn/x64.release.sample v8_monolith # 20 minutes


# -9- Doxygen vim plugin (no ubuntu package available?) (2017-05 not tested yet)
mkdir -p ~/.vim/plugin 
wget 'http://www.vim.org/scripts/download_script.php?src_id=14064' -O ~/.vim/plugin/doxygen.vim

# # -12- Brave browser (faster than chrome, no popups)
# cd ~/local/distributions
# wget -O brave.deb https://laptop-updates.brave.com/latest/dev/ubuntu64
# sudo dpkg -i brave.deb



# node / npm
cd ~/local/distributions
sudo update-ca-certificates
wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
tar -xJf node-v16.13.0-linux-x64.tar.xz 
sudo ln -s /usr/local/node-v16.13.0-linux-x64/bin/node /usr/local/bin/node
sudo ln -s /usr/local/node-v16.13.0-linux-x64/bin/npm /usr/local/bin/npm


#   # # separate version of node and jdk , if only to distribute with packages
#   # 2020-01-07 not tested yet:
#   cd ~/local/distributions
#   wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz
#   cd ../bin
#   tar xf ../distributions/'node-v10.16.3-linux-x64.tar.xz'
#   ln -s 'node-v10.16.3-linux-x64' node
#   tar xf ../distributions/'openjdk-11+28_linux-x64_bin.tar.gz' # produces ./jdk-11/


