# MSYS2メモ
## ファイル説明

ファイル名                   | 機能                                          | 呼ぶべき場所
--                           | --                                            | --
./register_msys2_env.bat     | MSYS2用の環境変数を登録するバッチ             | windows
./register_right_click.reg   | 右クリックメニューにMSYS2を開くメニューを追加 | windows
./install_packman_package.sh | pacmanで入れとくべき最低限のパッケージたち    | mintty

## Tips
**タスクバーにMSYS固定するなら、下記のオプションを付けること**  
`-i /msys2.ico /usr/bin/zsh --login`
