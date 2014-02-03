dotfiles
========

How to Use
----------
**やること**  

``` bash
git clone https://github.com/kagerouttepaso/dotfiles
cd dotfiles
./install.sh
```

**注意**  
結構依存しているパッケージがある。  
必要なパッケージ一覧(Ubuntuのパッケージ名)以下のとおり

- git
- tmux
- zsh
- pandoc
- exuberant-ctags
- xclip
- curl
- silversearcher-ag

ubuntu12.04以上ならこっちを`git clone`してchefを走らせたほうが賢明です  
[Chef_work][Chef_work]

Cygwin
------
Windows環境でも基本的に必要パッケージをインストールして**やること**のコマンドを入れれば問題ない。  

### フォントの設定
フォントのインストールを行うとかっこいいCygwin環境を構築できる。  
インストールの仕方は[Help][Font_Install]を参照  

### 香り屋版Gvimへの対応
1. 一度Cygwinからvimを起動して必要なプラグインをダウンロード
2. `C:\Users\UserName`以下に、dotfileのファイルを下記の表のとおりにシンボリックリンクをはりつける
3. シンボリックリンクを貼るのには[このアプリ][Linux_shell_extension]を使用するといい感じです

dotfiles    | `C:\Users\UserName`
:--         |:--
`./_vimrc`  | `_vimrc`
`./_gvimrc` | `_gvimrc`
`./_vim`    | `.vim`

memo
----
cygwinでctagsを使うときはExuburantCtagsを使わないとうまく行かなそう


[Chef_work]: https://github.com/kagerouttepaso/chef_work "#:title"
[Linux_Shell_Extension]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download "シンボリックリンクを貼れるイカスソフト"
[Font_Install]: https://github.com/kagerouttepaso/dotfiles/blob/master/font/README.md "Fontのインストール"
