#!/bin/bash
source ./common_params.sh

sudo apt-get build-dep vim

sudo apt install python3-dev python-dev

if [ ! -d ./vim ]; then
    git clone https://github.com/vim/vim.git vim
fi
cd vim 
git fetch

source ../common_git_params.sh

echo ------- install vim ${LATEST_TAG_VERSION} !!!! ------
sleep 3

if [ "${LATEST_TAG_VERSION_HASH}" != "${HEAD_HASH}" ]; then
    git clean -fdx
    git reset --hard HEAD
fi
git checkout ${LATEST_TAG_VERSION}

# コンフィグはubuntu16.04 vim-gtk3のものを参考にした
# https://launchpad.net/ubuntu/+source/vim/2:8.0.0095-1ubuntu2/+build/11526657
./configure \
    --prefix=/usr/local \
    --mandir=/usr/local/share/man \
    --enable-gui=gtk2 \
    --with-features=huge \
    --without-local-dir \
    --with-compiledby="kagerouttepaso" \
    --enable-fail-if-missing \
    --enable-cscope \
    --enable-gpm \
    --enable-selinux \
    --disable-smack \
    --enable-multibyte \
    --enable-acl \
    --with-x \
    --enable-xim \
    --enable-gtk2-check \
    --disable-gnome-check \
    --disable-motif-check \
    --disable-athena-check \
    --disable-fontset \
    --enable-luainterp \
    --disable-mzschemeinterp \
    --enable-perlinterp \
    --enable-pythoninterp \
    --with-python-config-dir="${PYTHON2_CONFIG_DIR}" \
    --enable-python3interp \
    --with-python3-config-dir="${PYTHON3_CONFIG_DIR}" \
    --enable-rubyinterp \
    --enable-tclinterp \
    --with-tclsh=/usr/bin/tclsh

    #--enable-python3interp \
    #--with-python3-config-dir="${PYTHON3_CONFIG_DIR}" \
    #--disable-pythoninterp \
make -j ${CPUS}
sudo make install
