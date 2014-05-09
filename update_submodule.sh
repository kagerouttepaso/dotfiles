#!/bin/bash
PWD_DIR=`pwd`

SUBMODULES=(./_autojump ./_oh-my-zsh ./_vim/bundle/neobundle.vim)
for module in ${SUBMODULES[@]}
do
    cd ${PWD_DIR}/${module}
    sh -c "echo \"update ${module}\";git fetch ; git rebase origin/master" &
done
wait


