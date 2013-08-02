set HOME_DIR=C:\Users\userdir
set DOT_DIR=C:\cygwin\home\dotdir
mklink %HOME_DIR%\_vimrc  %DOT_DIR%\_vimrc
mklink %HOME_DIR%\_gvimrc %DOT_DIR%\_gvimrc
mklink /d %HOME_DIR%\.vim %DOT_DIR%\_vim
