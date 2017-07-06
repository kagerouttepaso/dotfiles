#!/bin/bash -eu
#sudo date --set @"$(wget -q http://ntp-a1.nict.go.jp/cgi-bin/jst -O - | sed -n 4p | cut -d. -f1)"
sudo date -s "$(curl http://ntp-a1.nict.go.jp/cgi-bin/time)"
