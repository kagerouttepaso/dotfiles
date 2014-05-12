#!/bin/bash
#install ncurses-5.9
set -e
echo "********** install ncurses-5.9 **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/ncurses-5.9.tar.gz ];then
    wget -x -O ${LOCAL_DIR}/zip/ncurses-5.9.tar.gz http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
fi
if [ ! -d ${LOCAL_DIR}/src/ncurses-5.9 ];then
    gzip -dc ${LOCAL_DIR}/zip/ncurses-5.9.tar.gz | tar xvf -
fi

if [ ! -f ${LOCAL_DIR}/lock/ncurses-5.9 ]; then
    cd ${LOCAL_DIR}/src/ncurses-5.9
    ./configure --prefix=$LOCAL_DIR
    make
    make install
    touch ${LOCAL_DIR}/lock/ncurses-5.9
fi
