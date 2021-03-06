#!/bin/bash -eu
source ./common_params.sh

sudo apt install clang-3.8 libclang-3.8-dev cmake

if [ ! -d ./Bear ]; then
    git clone https://github.com/rizsotto/Bear
    git gc --aggressive --prune=now
fi
cd Bear
git fetch
source ../common_git_params.sh

echo ------- install Bear ${LATEST_TAG_VERSION} !!!! ------
sleep 5

if [ "${LATEST_TAG_VERSION_HASH}" != "{HEAD_HASH}" ]; then
    git clean -fdx
    git reset --hard HEAD
fi
git checkout ${LATEST_TAG_VERSION}

mkdir build
cd build 
cmake ..
make -j ${CPUS}

sudo make install
