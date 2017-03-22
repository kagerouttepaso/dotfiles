#!/bin/bash
INSTALL_PKGS=( `cat pkglist` )
INSTALLED_PKGS=`pacman -Qqe`

# base-devel msys2-devel

pacman -Sy

for pkg in ${INSTALL_PKGS[@]}
do
    if [ -z "`echo ${INSTALLED_PKGS} | grep ${pkg}`" ]; then
        echo ${pkg} is not installed!!
        pacman -S ${pkg}
    else
        echo ${pkg} is installed
    fi
done

