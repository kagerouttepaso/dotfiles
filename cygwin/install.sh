#!/bin/bash
apt-cyg update
cat ./pkgs | xargs apt-cyg install 
