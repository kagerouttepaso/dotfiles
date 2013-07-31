#!/bin/sh
PWD_DIR=`pwd`
DOT_FILES=$( gitconfig vimrc zshrc vim tmux.conf )
for file in ${DOT_FILES}
do
    rm -rf ~/.${file}
    ln -s ${PWD_DIR}/_${file} ~/.${file}
done


if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

#case "${OSTYPE}" in
#freebsd*|darwin*)
#    if [ ! -e ~/bin ];then
#        mkdir ~/bin
#    fi
#    cp bin/tmuxx $HOME/bin/
#    cp bin/reattach-to-user-namespace $HOME/bin
#    echo "alias tmux='tmuxx'" >> ~/.bashrc
#    echo "alias tm='tmuxx'" >> ~/.bashrc
#    echo "alias tma='tmux attach'" >> ~/.bashrc
#    echo "alias tml='tmux list-window'" >> ~/.bashrc
#  ;;
#esac
