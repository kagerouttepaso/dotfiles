SET HOME_DIR=%USERPROFILE%
SET DOT_DIR=%~dp0
SET DOT_DIR=%DOT_DIR:~0,-1%
SET FONT_DIR=%DOT_DIR%\font
SET FONTREG=%FONT_DIR%\SetDouble-byteCharacter.reg
mklink %HOME_DIR%\_vimrc  %DOT_DIR%\_vimrc
mklink %HOME_DIR%\_gvimrc %DOT_DIR%\_gvimrc
mklink %HOME_DIR%\_vsvimrc %DOT_DIR%\_vsvimrc
mklink %HOME_DIR%\.gitconfig %DOT_DIR%\_gitconfig
mklink %HOME_DIR%\.bashrc %DOT_DIR%\_bashrc
mklink /d %HOME_DIR%\.bash %DOT_DIR%\_bash

echo cmdópÇÃê›íË
mklink /H %HOME_DIR%\powerline_core.lua   %DOT_DIR%\_cmder-powerline\powerline_core.lua
mklink /H %HOME_DIR%\powerline_prompt.lua %DOT_DIR%\_cmder-powerline\powerline_prompt.lua
mklink /H %HOME_DIR%\powerline_git.lua    %DOT_DIR%\_cmder-powerline\powerline_git.lua
