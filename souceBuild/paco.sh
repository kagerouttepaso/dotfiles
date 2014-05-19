#!/bin/bash
#install paco-2.0.9
set -e
echo "********** install paco-2.0.9 **********"
LOCAL_DIR=$HOME/local
if [ ! -d ${LOCAL_DIR}/src ]; then
    mkdir -p ${LOCAL_DIR}/src
fi
if [ ! -d ${LOCAL_DIR}/zip ]; then
    mkdir -p ${LOCAL_DIR}/zip
fi
if [ ! -d ${LOCAL_DIR}/lock ]; then
    mkdir -p ${LOCAL_DIR}/lock
fi

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/paco-2.0.9.tar.bz2 ];then
    wget -x -O ${LOCAL_DIR}/zip/paco-2.0.9.tar.bz2 http://sourceforge.net/projects/paco/files/paco/2.0.9/paco-2.0.9.tar.bz2/download
fi
if [ ! -d ${LOCAL_DIR}/src/paco-2.0.9 ];then
    bzip2 -dc ${LOCAL_DIR}/zip/paco-2.0.9.tar.bz2 | tar xvf -
fi

if [ ! -f ${LOCAL_DIR}/lock/paco-2.0.9 ]; then
    cd ${LOCAL_DIR}/src/paco-2.0.9
    ./configure --prefix=$LOCAL_DIR  --disable-gpaco --with-paco-logdir=$LOCAL_DIR/var/log/paco
    make
    make install
    make logme
    touch ${LOCAL_DIR}/lock/paco-2.0.9
fi
