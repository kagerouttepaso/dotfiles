#!/bin/bash
#install tmux1.9a
set -e
if [ ! -f /usr/local/lib/libevent-2.0.so.5 ]; then
    ./libevent.sh 
fi

echo "********** install tmux1.9a **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/tmux1.9a.tar.gz ];then
    wget -x -O \
        ${LOCAL_DIR}/zip/tmux1.9a.tar.gz \
        http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
fi
if [ ! -d ${LOCAL_DIR}/src/tmux-1.9a ];then
    gzip -dc  ${LOCAL_DIR}/zip/tmux1.9a.tar.gz | tar xvf -
fi

#if [ -f ~/local/lib/libncurses.a ]; then
#    export CFLAGS="${CFLAGS} -I${LOCAL_DIR}/include/ncurses"
#    export LDFLAGS="${LDFLAGS} -L${LOCAL_DIR}/lib/"
#    export CPPFLAGS="${CPPFLAGS} -I${LOCAL_DIR}/include/ncurses"
#fi
if [ -f ${LOCAL_DIR}/lib/libevent-2.0.so.5 ];then
    export CFLAGS="${CFLAGS} -I${LOCAL_DIR}/include"
    export LDFLAGS="${LDFLAGS} -L${LOCAL_DIR}/lib/"
    export CPPFLAGS="${CPPFLAGS} -I${LOCAL_DIR}/include"
fi
echo $CFLAGS
echo $LDFLAGS
echo $CPPFLAGS

if [ ! -f ${LOCAL_DIR}/lock/tmux1.9a ]; then
    cd ${LOCAL_DIR}/src/tmux-1.9a
    ./configure --enable-static --prefix=${LOCAL_DIR} CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
    make
    paco -lD "make install"
    #touch ${LOCAL_DIR}/lock/tmux1.9a
fi

