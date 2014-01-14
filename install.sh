#!/bin/bash -x

#need apps
#tmux more than ver 1.7
#zsh
#git
#ctags

PWD_DIR=`pwd`
DOT_FILES=( gitconfig vimrc zshrc vim tmux.conf minttyrc )
for file in ${DOT_FILES[@]}
do
    rm -rf ~/.${file}
    ln -s ${PWD_DIR}/_${file} ~/.${file}
done

if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

if [ ! -d ~/.oh-my-zsh ] ; then
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi



if [ ! -f bash.lock ] ; then
    touch bash.lock
    echo "alias tmux='tmux -2'" >> ~/.bashrc
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
