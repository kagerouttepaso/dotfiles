#!/bin/bash.exe
apt-cyg show --no-header > ./pkgs
sed -i -e "s/\([^ ]*\).*/\1/g" ./pkgs

