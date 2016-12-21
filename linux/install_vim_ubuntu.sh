#!/bin/bash
sudo apt-get build-dep vim

sudo apt-get install python3-dev
PYTHON3_CONFIG_CODE="import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LIBPL'))"
PYTHON3_CONFIG_DIR=`python3  -c "${PYTHON3_CONFIG_CODE}"`

if [ ! -d ./vim ]; then
    git clone https://github.com/vim/vim.git vim
fi
cd vim 
git fetch
git reset --hard HEAD
git clean -fdx

LATEST_VIM_VERTION=`git tag | tail -n1`
echo ------- install vim ${LATEST_VIM_VERTION} !!!! ------
sleep 3
git checkout ${LATEST_VIM_VERTION}

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
 --enable-python3interp \
 --with-python3-config-dir="${PYTHON3_CONFIG_DIR}" \
 --disable-pythoninterp \
 --enable-rubyinterp \
 --enable-tclinterp \
 --with-tclsh=/usr/bin/tclsh

CPUS=`cat /proc/cpuinfo | grep -c processor`
make -j ${CPUS}
sudo make install
