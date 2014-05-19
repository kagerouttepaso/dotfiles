#!/bin/bash
#install readline-6.3
set -e
echo "********** install readline-6.3 **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/readline-6.3.tar.gz ];then
    wget -x -O ${LOCAL_DIR}/zip/readline-6.3.tar.gz ftp://ftp.cwru.edu/pub/bash/readline-6.3.tar.gz
fi
if [ ! -d ${LOCAL_DIR}/src/readline-6.3 ];then
    gzip -dc ${LOCAL_DIR}/zip/readline-6.3.tar.gz | tar xvf -
fi

if [ ! -f ${LOCAL_DIR}/lock/readline-6.3 ]; then
    cd ${LOCAL_DIR}/src/readline-6.3
    ./configure --prefix=$LOCAL_DIR
    make
    paco -lD "make install"
    touch ${LOCAL_DIR}/lock/readline-6.3
fi
