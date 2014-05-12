SET HOME_DIR=%USERPROFILE%
SET DOT_DIR=%~dp0
SET DOT_DIR=%DOT_DIR:~0,-1%
SET FONTREG=%DOT_DIR%\font\SetInconsolataFont.reg
mklink %HOME_DIR%\_vimrc  %DOT_DIR%\_vimrc
mklink %HOME_DIR%\_gvimrc %DOT_DIR%\_gvimrc
mklink %HOME_DIR%\.gitconfig %DOT_DIR%\_gitconfig
regedit.exe /s %FONTREG%
