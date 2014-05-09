#!/bin/bash -x
PWD_DIR=`pwd`

SUBMODULES=(./_autojump ./_oh-my-zsh ./_vim/bundle/neobundle.vim)
for module in ${SUBMODULES[@]}
do
    cd ${PWD_DIR}/${module}
    git fetch ; git rebase origin/master
done



