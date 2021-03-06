#!/bin/bash -eu
PWD_DIR=`pwd`

if [ "`uname -sr | grep CYGWIN`" ] ; then
    echo update cygwin package list..
    cd cygwin
    ./update_list.sh
    cd ${PWD_DIR}
fi

SUBMODULES=(./_vim/bundle/neobundle.vim ./_tmux-powerline ./_apt-cyg ./_zplug)
for module in ${SUBMODULES[@]}
do
    cd ${PWD_DIR}/${module}
    sh -c "echo \"update ${module}\";git fetch ; git rebase origin/master;git gc --aggressive --prune=now > /dev/null" &
done
wait

cd ${PWD_DIR}
git fetch; git gc --aggressive --prune=now
