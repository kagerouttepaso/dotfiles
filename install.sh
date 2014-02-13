#!/bin/bash -x

#need apps
#tmux more than ver 1.7
#zsh
#git
#ctags

git submodule update

if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi

PWD_DIR=`pwd`
DOT_FILES=( gitconfig vimrc gvimrc zshrc vim screenrc tmux.conf minttyrc bash bashrc)
for file in ${DOT_FILES[@]}
do
    if [ -L ~/.${file} ]; then
        rm -f ~/.${file}
    elif [ -d ~/.${file} ]; then
        rm -rf ~/.backup/.${file}
        cp -r ~/.${file} ~/.backup/.${file}
        rm -rf ~/.${file}
    elif [ -f ~/.${file} ]; then
        rm -rf ~/.backup/.${file}
        cp ~/.${file} ~/.backup/.${file}
        rm -f ~/.${file}
    fi
    ln -s ${PWD_DIR}/_${file} ~/.${file}
done

if [ ! -f ~/.my_proxy_setting ]; then
    touch ~/.my_proxy_setting
fi


