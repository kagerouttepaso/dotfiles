rem シンボリック有効(mintty.exeを管理者として実行するよう設定しないと意味がない)
setx MSYS "winsymlinks:nativestrict"
rem PATHの設定を引き継ぐ
setx MSYS2_PATH_TYPE "inherit"
rem MINGW64を選択
setx MSYSTEM "MINGW64"
rem mintty.exeを呼び出した場所をカレントフォルダとする
setx CHERE_INVOKING "enabled_from_arguments"
