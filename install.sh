#!/bin/bash -x

#need apps
#tmux more than ver 1.7
#zsh
#git
#ctags


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

if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
    git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

if [ ! -d ~/.oh-my-zsh ] ; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ ! -d ${PWD_DIR}/autojump ]; then
    git clone https://github.com/joelthelion/autojump.git
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
