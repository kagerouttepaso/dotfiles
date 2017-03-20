#!/bin/bash
source ../linux/common_params.sh
# pacman -S base-devel msys2-devel
# pacman -S ncurses-devel libcrypt-devel gettext-devel

VERSION=5.3.4
if [ ! -d ./lua-${VERSION} ];then
    curl -O http://www.lua.org/ftp/lua-${VERSION}.tar.gz
    tar xzf lua-${VERSION}.tar.gz
    rm lua-${VERSION}.tar.gz
fi

cd lua-${VERSION}
make mingw -j ${CPUS}
make install

cp ./src/lua53.dll /usr/bin
