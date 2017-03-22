#!/bin/bash
source ../linux/common_params.sh

UNAME=`uname | grep MSYS`
if [ -z ${UNAME} ]; then
    echo Please run msys env
#    exit
fi

if [ ! -d ./vim ]; then
    git clone https://github.com/vim/vim.git vim
fi
cd vim
git fetch

source ../../linux/common_git_params.sh
echo cups = ${CPUS}

echo ------- install vim ${LATEST_TAG_VERSION} !!!! ------
sleep 3

if [ "${LATEST_TAG_VERSION_HASH}" != "${HEAD_HASH}" ]; then
    git clean -fdx
    git reset --hard HEAD
fi
git checkout ${LATEST_TAG_VERSION}

./configure \
    CFLAGS="-march=native -O3" \
    CPPFLAGS="-I/usr/include/ncursew" \
    --prefix=/usr/local \
    --with-compiledby="kagerouttepaso" \
    --enable-fail-if-missing \
    --with-features=huge \
    --with-tlib=ncursesw \
    --enable-cscope \
    --enable-multibyte \
    --enable-perlinterp=yes \
    --enable-rubyinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-luainterp \
    --with-lua-prefix=/usr/local \
    --without-x \
    --disable-athena-check \
    --disable-carbon-check \
    --disable-motif-check \
    --disable-gtk2-check \
    --disable-nextaw-check \
    --disable-selinux \
    --disable-smack \
    --disable-darwin \
    --disable-mzschemeinterp \
    --disable-tclinterp \
    --disable-workshop \
    --disable-gpm \
    --disable-sysmouse \
    --disable-gui

make -j ${CPUS}
make install
