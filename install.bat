SET HOME_DIR=%USERPROFILE%
SET DOT_DIR=%~dp0
SET DOT_DIR=%DOT_DIR:~0,-1%
SET FONT_DIR=%DOT_DIR%\font
SET FONTREG=%FONT_DIR%\SetInconsolataFont.reg
mklink %HOME_DIR%\_vimrc  %DOT_DIR%\_vimrc
mklink %HOME_DIR%\_gvimrc %DOT_DIR%\_gvimrc
mklink %HOME_DIR%\.gitconfig %DOT_DIR%\_gitconfig
mklink %HOME_DIR%\.bashrc %DOT_DIR%\_bashrc
mklink /d %HOME_DIR%\.bash %DOT_DIR%\_bash
cd %FONT_DIR%
start ./Inconsolata-Bold.ttf
start ./Inconsolata-Regular.ttf
start ./Inconsolata-g-Powerline.ttf
regedit.exe /s %FONTREG%
