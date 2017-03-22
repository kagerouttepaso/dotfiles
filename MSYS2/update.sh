#!/bin/bash
# apt update | apt full-upgrade
pacman -Syu

# apt-get autoremove
pacman -Qdtq | pacman -Rs -
