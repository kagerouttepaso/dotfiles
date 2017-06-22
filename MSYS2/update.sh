#!/bin/bash -eu
# apt update | apt full-upgrade
pacman -Syu

# apt-get autoremove
pacman -Rns $(pacman -Qdtq)
