#!/bin/bash

mkdir rpms
cd rpms
PWD_DIR=`pwd`
wget http://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
wget  https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
wget  http://downloads.sourceforge.net/tmux/tmux-1.8.tar.gz

tar -zxvf libevent-2.0.21-stable.tar.gz
tar -zxvf tmux-1.8.tar.gz
bzip2 -cd vim-7.4.tar.bz2 | tar -xvf -
rm *.tar.bz*

RPM_FILES=( libevent-2.0.21-stable tmux-1.8 vim74 )
for file in ${RPM_FILES[@]}
do
    cd ${file}
    ./configure
    make
    sudo make install
    cd ..
done


