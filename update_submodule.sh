#!/bin/bash
PWD_DIR=`pwd`

SUBMODULES=(./_oh-my-zsh ./_vim/bundle/neobundle.vim ./_tmux-powerline)
for module in ${SUBMODULES[@]}
do
    cd ${PWD_DIR}/${module}
    sh -c "echo \"update ${module}\";git fetch ; git rebase origin/master;git gc --aggressive --prune=now > /dev/null" &
done
wait

cd ${PWD_DIR}
git fetch; git gc --aggressive --prune=now
