#!/bin/bash
#install libevent-2.0.21-stable
set -e

echo "********** install libevent-2.0.21-stable **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/libevent-2.0.21-stable.tar.gz ];then
    wget -x -O \
        ${LOCAL_DIR}/zip/libevent-2.0.21-stable.tar.gz \
        https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
fi
if [ ! -d ${LOCAL_DIR}/src/libevent-2.0.21-stable ];then
    gzip -dc  ${LOCAL_DIR}/zip/libevent-2.0.21-stable.tar.gz | tar xvf -
fi

if [ ! -f ${LOCAL_DIR}/lock/libevent-2.0.21-stable ]; then
    cd ${LOCAL_DIR}/src/libevent-2.0.21-stable
    ./configure --prefix=${LOCAL_DIR}
    make
    paco -lD "make install"
    touch ${LOCAL_DIR}/lock/libevent-2.0.21-stable
fi
