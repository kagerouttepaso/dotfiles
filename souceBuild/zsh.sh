#!/bin/bash
#install zsh-5.0.2
set -e
echo "********** install zsh-5.0.2 **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/zsh-5.0.2.tar.bz2 ];then
    wget -x -O ${LOCAL_DIR}/zip/zsh-5.0.2.tar.bz2 http://sourceforge.net/projects/zsh/files/zsh/5.0.2/zsh-5.0.2.tar.bz2/download
fi
if [ ! -d ${LOCAL_DIR}/src/zsh-5.0.2 ];then
    bzip2 -dc ${LOCAL_DIR}/zip/zsh-5.0.2.tar.bz2 | tar xvf -
fi

if [ ! -f ${LOCAL_DIR}/lock/zsh-5.0.2 ]; then
    cd ${LOCAL_DIR}/src/zsh-5.0.2
    ./configure --prefix=$LOCAL_DIR --enable-cflags="-I$LOCAL_DIR/include" --enable-cppflags="-I$LOCAL_DIR/include" --enable-ldflags="-L$LOCAL_DIR/lib"  --enable-multibyte --enable-locale
    make
    make install
    touch ${LOCAL_DIR}/lock/zsh-5.0.2
fi
