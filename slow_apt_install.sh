#!/bin/bash


# -2- OPENCV-3.0
# ubuntu opencv=2.4.8, I need 3.0 (for schuelerlabor-2.0)
cd ~/local/distributions
wget https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip -O opencv-3.0.0-alpha.zip
unzip opencv-3.0.0-alpha.zip
mkdir opencv-3.0.0-alpha/build
cd opencv-3.0.0-alpha/build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/local ..
make -j4 
make install

# -3- OPENBABEL
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
ln -s openbabel-2.0/openbabel



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
#   gn args out.gn/x64.release
#      *** dabei oeffnet sich gvim und es muessen folgende Zeilen hinzugefuegt werden:
#     is_component_build = false
#     v8_static_library = true
# und dann:
# ninja -C out.gn/x64.release/  # dauert: ~40 Minuten?
# und:
# ln -s out.gn/x64.release/natives_blob.bin sowie snapshot_blob.bin
# ln -s ../distributions/v8/out.gn/x64.release/obj/ v8
# 

#alt
# make -j4  x64.release # takes ~ 1 hour
# mkdir -p ~/local/include/v8
# cp -r include/* ~/local/include/v8
# cp out/x64.release/obj.target/src/lib*.a ~/local/lib
# cp out/x64.release/obj.target/third_party/icu/lib*.a ~/local/lib
# cp out/x64.release/*.bin ~/local/lib

# -8- NWChem
cd ~/local/distributions
wget 'http://www.nwchem-sw.org/download.php?f=Nwchem-6.6.revision27746-src.2015-10-20.tar.bz2'
bunzip2 download.php\?f\=Nwchem-6.6.revision27746-src.2015-10-20.tar.bz2
tar xf download.php\?f\=Nwchem-6.6.revision27746-src.2015-10-20.tar 
cd nwchem-6.6
export USE_MPI=y
export NWCHEM_TARGET=LINUX64
export USE_PYTHONCONFIG=y
export PYTHONVERSION=2.7
export PYTHONHOME=/usr
export BLASOPT="-lopenblas -lpthread -lrt"
export BLAS_SIZE=4
export USE_64TO32=y
cd src
export NWCHEM_TOP=/home/rafel/local/distributions/nwchem-6.6/
make nwchem_config NWCHEM_MODULES="all python"
date
make  64_to_32   # dauert 15 Minuten auf 6200U
make            # nochmal 20 Minuten
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


