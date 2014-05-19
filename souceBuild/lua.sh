#!/bin/bash
#install lua-5.2.3
set -e

if [ ! -f /usr/lib/libncurses.a ]; then
    ./ncurses.sh
fi
if [ ! -f /usr/lib/libreadline.a ]; then
    ./readline.sh
fi

echo "********** install lua-5.2.3 **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/lua-5.2.3.tar.gz ];then
    wget -x -O ${LOCAL_DIR}/zip/lua-5.2.3.tar.gz http://www.lua.org/ftp/lua-5.2.3.tar.gz
fi
if [ ! -d ${LOCAL_DIR}/src/lua-5.2.3 ];then
    gzip -dc ${LOCAL_DIR}/zip/lua-5.2.3.tar.gz | tar xvf -
fi

build_config=""
if [ ! -f /usr/local/lib/libncurses.a ] || [ ! -f /usr/local/lib/libreadline.a]; then
    build_config=${build_config} \
        MYCFLAGS="-I${HOME}/local/include" \
        MYLDFLAGS="-L${HOME}/local/lib/"  \
        MYLIBS="-ltermcap"
fi
if [ ! -f ${LOCAL_DIR}/lock/lua-5.2.3 ]; then
    cd ${LOCAL_DIR}/src/lua-5.2.3
    make linux
    paco -lD "make install INSTALL_TOP=\"${HOME}/local\""
    touch ${LOCAL_DIR}/lock/lua-5.2.3
fi
