#!/bin/bash

# 2019: opencv jetz mit apt-get
#  # -2- OPENCV-3.0
#  # ubuntu opencv=2.4.8, I need 3.0 (for schuelerlabor-2.0)
#  cd ~/local/distributions
#  wget https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip -O opencv-3.0.0-alpha.zip
#  unzip opencv-3.0.0-alpha.zip
#  mkdir opencv-3.0.0-alpha/build
#  cd opencv-3.0.0-alpha/build
#  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/local ..
#  make -j4 
#  make install

# -3- OPENBABEL
# moved back to non_apt_install

# -7- V8 Engine
# moved back to non_apt_install


# -8- NWChem
cd ~/local/distributions
wget 'https://github.com/nwchemgit/nwchem/releases/download/v6.8-release/nwchem-6.8-release.revision-v6.8-47-gdf6c956-srconly.2017-12-14.tar.bz2'
bunzip2 'nwchem-6.8-release.revision-v6.8-47-gdf6c956-srconly.2017-12-14.tar.bz2'
tar xf 'nwchem-6.8-release.revision-v6.8-47-gdf6c956-srconly.2017-12-14.tar'

# TODO: edit util_fadvise.c, see: https://github.com/nwchemgit/nwchem/issues/41
# folgende Alternative zum edit nutze ich *nicht* mehr:
# wget 'https://github.com/nwchemgit/nwchem/archive/hotfix/release-6-8.zip'
# unzip 'release-6-8.zip'
# mv nwchem-hotfix-release-6-8/ nwchem-hotfix-6-8/  # nwchem-top cannot be >64 characters
# cd nwchem-hotfix-6-8/

cd nwchem-6.8/
export USE_MPI=n
export NWCHEM_TOP=/home/rafel/local/distributions/nwchem-6.8/
export NWCHEM_TARGET=LINUX64
export USE_PYTHONCONFIG=y
export PYTHONVERSION=2.7
export PYTHONHOME=/usr
export BLASOPT="-lopenblas -lpthread -lrt"
export BLAS_SIZE=4
export USE_64TO32=y
cd src
make nwchem_config NWCHEM_MODULES="all python" > make_config.log
date; make  64_to_32 > make_64_to_32.log # dauert 15 Minuten auf 6200U
make -j6  > make.log   # nochmal 20 Minuten (j4 hat *wohl* einen Effekt?)
date  # mit j4 insgesam nur noch 27 Minuten auf 6200U
cp ../bin/LINUX64/nwchem ~/local/bin


# -10- libint package calculating QM integrals
# folgendes funktioniert fuer sich (make check) aber nicht mit meinem Code
#  wget 'https://github.com/evaleev/libint/releases/download/v2.3.1/libint-2.3.1-test-mpqc3.tgz'
#  tar xf libint-2.3.1-test-mpqc3.tgz 
#  cd libint-2.3.1/
#  ./configure --prefix=/home/rafel/local/ CXXFLAGS='-std=c++0x'
#  make -j4

cd ~/local/distributions
git clone https://github.com/evaleev/libint.git
cd libint
./autogen.sh
mkdir ../buildLIBINT
cd ../buildLIBINT
../libint/configure --prefix=/home/rafel/local/ CXXFLAGS='-std=c++0x'
make -j4
# TODO: change line 40 of libint/include/libint2.h to:
#   //    using value_type = LIBINT2_REALTYPE;
#   typedef LIBINT2_REALTYPE value_type;
# und dann wie folgt abschliessen:
# sudo make install # installiert in /usr/local/libint
# cp -r ../libint/include/* ~/local/include

# -11- intel opencl (NOT TESTED YET)
cd ~/local/distributions
mkdir intel-opencl-driver
cd intel-opencl-driver
wget 'http://registrationcenter-download.intel.com/akdlm/irc_nas/11396/SRB5.0_linux64.zip'
unzip SRB5.0_linux64.zip
mkdir ../intel-opencl
ln -s ../intel-opencl
tar -C intel-opencl -Jxf intel-opencl-r5.0-63503.x86_64.tar.xz
tar -C intel-opencl -Jxf intel-opencl-devel-r5.0-63503.x86_64.tar.xz
tar -C intel-opencl -Jxf intel-opencl-cpu-r5.0-63503.x86_64.tar.xz
cd ..
sudo cp -R intel-opencl/* /
sudo ldconfig
cd ../include
ln -s ../distributions/intel-opencl/opt/intel/opencl/include/CL .

# # -12- Brave browser (faster than chrome, no popups)
# cd ~/local/distributions
# wget -O brave.deb https://laptop-updates.brave.com/latest/dev/ubuntu64
# sudo dpkg -i brave.deb


