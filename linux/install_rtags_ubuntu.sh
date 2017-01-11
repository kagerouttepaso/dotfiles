#!/bin//bash
source ./common_params.sh

sudo apt-get install clang-3.8 libclang-3.8-dev cmake

if [ ! -d ./rtags ]; then
    git clone https://github.com/Andersbakken/rtags
    git gc --aggressive --prune=now
fi
cd rtags
git fetch

source ../common_git_params.sh
echo ------- install rtags ${LATEST_TAG_VERSION} !!!! ------
sleep 5

if [ "${LATEST_TAG_VERSION_HASH}" != "{HEAD_HASH}" ]; then
    git clean -fdx
    git reset --hard HEAD
fi
git checkout ${LATEST_TAG_VERSION}

git submodule init
git submodule update
mkdir build
cd build 
cmake ..
make -j ${CPUS}

sudo make install
