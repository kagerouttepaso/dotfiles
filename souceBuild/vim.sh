#!/bin/bash
#install vim7.4
set -e

if builtin command -v lua >> /dev/null ; then
    ./lua.sh
fi

echo "********** install vim7.4 **********"
LOCAL_DIR=$HOME/local
./mkdir.sh

cd ${LOCAL_DIR}/src
if [ ! -f ${LOCAL_DIR}/zip/vim-7.4.tar.bz2 ];then
    wget -x -O ${LOCAL_DIR}/zip/vim-7.4.tar.bz2 ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
fi
if [ ! -d ${LOCAL_DIR}/src/vim74 ];then
    bzip2 -dc ${LOCAL_DIR}/zip/vim-7.4.tar.bz2 | tar xvf -
fi

build_config="--with-features=huge \
    --enable-fail-if-missing \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-multibyte \
    --enable-gpm \
    --enable-gui=gnome2 \
    --enable-xim \
    --enable-luainterp \
    --disable-selinux \
    --prefix=$LOCAL_DIR"

if [ "`builtin command -v lua | grep ${LOCAL_DIR}`" != ""  ]; then
    build_config="${build_config} --with-lua-prefix=$LOCAL_DIR"
else
    build_config="${build_config} --with-lua-prefix=/usr/local"
fi

if [ ! -f ${LOCAL_DIR}/lock/vim-7.4 ]; then
    cd ${LOCAL_DIR}/src/vim74
    ./configure ${build_config}
    make
    make install
    touch ${LOCAL_DIR}/lock/vim-7.4
fi
