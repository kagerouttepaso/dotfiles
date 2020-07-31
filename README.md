# dotfiles

## How to Use

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
- [pandoc][link_pandoc_releace]
- exuberant-ctags
- xclip
- curl
- ~~silversearcher-ag~~
- [pt][link_download_pt]
- clang
- [rtags][link_github_rtags]
- npm
  - mermaid
  - markdown-pdf
  
~~ubuntu12.04以上ならこっちを`git clone`してchefを走らせたほうが賢明です  
[Chef_work][Chef_work]~~

## Windows環境

### MSYS2

- [ここからダウンロード](https://sourceforge.net/projects/msys2/files/latest/download)
- [/MSYS2/register_msys2_env.bat](/MSYS2/register_msys2_env.bat)使って環境変数を登録
- [/MSYS2/register_right_click.reg](/MSYS2/register_right_click.reg)使って右クリックメニュー登録
- X11転送使うときはXming使うこと。xmingは[/windows/choco/install_packages.bat](/windows/choco/install_packages.bat)使ってインストール

### Cygwin

Windows環境でも基本的に必要パッケージをインストールして**やること** のコマンドを入れれば問題ない。  
x11のパッケージセットをインストールすればssh接続先のクリップボードの共有もできる用になっています  
**Cygwinを使うのをやめました**

#### 入れるパッケージ

- git
- zsh
- ctags
- x11すべて
- curl
- openssh
- tmux

### teraterm

[設定ファイル](./windows/TERATERM.INI) を読みこめばいい感じになる  

### 香り屋版Gvimへの対応

1. Source Treeをダウンロードしてインストール、この`Dotfiles`を好きなところにCloneしてくる。  
2. [install.bat](./install.bat) を管理者権限で実行
   手順は[unite-everythingのヘルプ][unite-everything_install]を参照
3. [香り屋版Gvim][Kaoriya_gvim_download]をダウンロード  
4. [Windows版ag](http://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html)をダウンロードしてくる  
   ダウンロードしてきた実行ファイルはgvimのファルダにつっこむ
5. gvimを起動ここで色々エラーが出るけど気にしない。
   ﾌﾟﾗｷﾞﾝのインストールするか聞かれるけどNOを選択。  
   `:NeobundleInstall`でプラグインをインストール!!
6. 快適なGvimライフへようこそ

Windows上だとrgrepがうまく動かないのでUniteGrepを使ってください

dotfiles    | `C:\Users\UserName`
:--         |:--
`./_vimrc`  | `_vimrc`
`./_gvimrc` | `_gvimrc`
`./_vim`    | `.vim`

### その他メモ

- シンボリックリンクを貼るのには[このアプリ][Linux_shell_extension]を使用するといい感じです
- フォントのインストールを行うとかっこいいCygwin、teraterm環境を構築できる。  
  インストールの仕方は[Help][Font_Install]を参照  
  [install.bat](./install.bat)を実行すれば自動で入る
- mingwについて
  - [Mingw64のダウンロード][link_mingw_64_download]
  - [MIngw32とmsysのダウンロード][link_msys_windows_download]
  - [Node.jsのダウンロード][nodejs_homepage]

## コマンド
自前で設定したコマンドとか

### zsh

**all Platform**  

command   | mean
:--       |:--
tmux      |`tmux -2`
sshx      |`ssh -XC`
zshrc     |`vim ~/.zshrc`
vimrc     |`vim ~/.vimrc`
sshconfig |`vim ~/.ssh/config`
j         |run autojump

**Linux**  

command   | mean
:--       |:--
tmuxx     |`tmux attach -d`
md2html   |file encoded HTML in pandoc, and open in browser

**cygwin**  

command   | mean
:--       |:--
cdcyg     |move to desktop

### vim

#### 主な変更

- バックアップ取らない
- スワップ作らない
- バックスペースで色々消せる
- ビープ音鳴らさない
- モードを表示
- マウスを使用する
- クリップボードを使用する
- 全角スペースを表示
- tagsファイルは6回階層上のものまで読み込む
- 前回終了したカーソル行に移動
- 補完にはNeocomplateを使用するが、使えない時はNeocomplecacheを使う

#### vimのシンタックス

**javascript**
vimを使ってjavascriptの編集をするときは `hshint` をインストールするとシンタックスのチェックをしてもらえる  
windows環境でそれを行うときは、[nodejsをダウンロード][Nodejs_HomePage]して下記のコマンドを実行

#### 拡張コマンド

**挿入モード**  

command | mean
:--     | :--
`<C-p>` | 貼付け
`<C-j>` | `<Down>`
`<C-k>` | `<Up>`
`<C-h>` | `<Left>`
`<C-l>` | `<Right>`
`jj`    | `<esc>`
`,`     | `,<Space>`

**ノーマルモード**  

command      | mean
:--          | :--
`<Space>`    | 次のバッファへ
`b`          | 前のバッファへ
`<C-g><C-g>` | カーソル下の単語をバッファを対象にGrep
`<C-g><C-r>` | カーソル下の単語をカレントフォルダから再帰的にGrep
`Ctags`      | :!ctags -R
`tt`         | タグジャンプ
`tb`         | 現在開いているバッファを閉じてタグスタックをひとつ戻す
`t1~t9`      | 対応したタブ番号へ飛ぶ
`tn`         | 次のタブへ
`tp`         | 前のタブへ
`tr`         | バッファをタブ展開
`0`          | 行末へ
`9`          | 行頭へ
`+`          | フレームサイズ増加
`-`          | フレームサイズ減少
`(`          | 対応するカッコに移動
`)`          | 対応するカッコに移動
`vy`         | カーソル位置の単語をヤンク
`<C-j>`      | `<C-w>j`
`<C-k>`      | `<C-w>k`
`<C-l>`      | `<C-w>l`
`<C-h>`      | `<C-w>h`
`gl`         | `:GitGutterNextHunk`
`gh`         | `:GitGutterPrevHunk`
`<C-p>`      | ペーストするレジスタを一つ古いものにする(ペーストした直後のみ)
`<C-n>`      | ペーストするレジスタを一つ新しいものにする(ペーストした直後のみ)
`ss`         | 置換開始
`sw`         | カーソル以下の単語を置換
`gx`         | カーソル以下の単語でブラウザ検索

**ビジュアルモード**  

command   | mean
:--       | :--
`0`       | 行末へ
`v`       | 行末へ
`9`       | 行頭へ
`sw`      | 文書全体で、選択した文章を置換
`ss`      | 選択した範囲を置換
`<Enter>` | Alignの修正モードへ
`gx`      | カーソル以下の単語でブラウザ検索

**コマンド**  

command   |mean
:--       |:--
Tig       |gitのログビュアー
QB        |ウィンドウの形を変えずにバッファを閉じる
QB        |バッファを閉じてウィンドウも閉じる
TN        |NERDTree起動
TS        |SourceExplorer起動
TT        |TagList起動
TA        |上記3つを起動
Rgrep     |カーソル下の単語をカレントディレクトリからgrep
Bgrep     |カーソル下の単語をバッファからgrep
VimShell  |VimShellの起動
VimFiler  |VimFilerの起動

**Unite**  
Grepの検索エンジンにはagが使えればそちらを使う  

command  | mean
:--      | :--
f        | [unite]
[unite]u | `<C-u>Unite -no-split<Space>`
[unite]a | 全部乗せ`<C-u>Unite -buffer-name=all buffer file_mru bookmark file grep:. find:.<CR><C-r><C-w><CR>*<C-r><C-w>*<CR>`
[unite]b | バッファ一覧`<C-u>Unite buffer<CR>`
[unite]h | 最近使用したファイル一覧`<C-u>Unite buffer file_mru<CR>`
[unite]d | カレントディレクトリからファイル一覧`<C-u>Unite -buffer-name=files file<CR>`
[unite]D | Gitのカレントディレクトリからファイル一覧`<C-u>Unite -buffer-name=git_files file_rec/async:! -winheight=15<CR>`
[unite]c | 現在のバッファのディレクトリからファイル一覧`<C-u>UniteWithBufferDir -buffer-name=files file<CR>`
[unite]r | レジスタ一覧`<C-u>Unite register<CR>`
[unite]g | グレップ検索`<C-u>Unite grep:. -buffer-name=serch-buffer -no-quit<CR><C-r><C-w><CR>`
[unite]G | グレップ検索(対話的)`<C-u>Unite grep  -no-quit<CR>`
[unite]f | ファイル検索(win以外)`<C-u>Unite find:. -buffer-name=serch-file -no-quit<CR>*<C-r><C-w>*<CR>`
[unite]f | ファイル検索(win) **日本語が文字化けしてしまう…**`<C-u>UniteWithCursorWord everything/async -no-quit<CR>`
[unite]F | ファイル検索(win)`<C-u>Unite everything/async -no-quit<CR>`
[unite]s | ソースリスト`<C-u>Unite source<CR>`
[unite]o | アウトラインを展開`<C-u>Unite outline -buffer-name=outline -no-focus -no-start-insert<CR>`
[unite]t | アウトラインを展開`<C-u>Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit<CR>`

### teratermとscreen

キーバインドを変更してある。とりあえず[tmux.conf](./_tmux.conf)と[screenrc](./_screenrc)を見てください。  
バインドはteratermが`Ctrl+o`screenが`ctrl+a`にバインドされてます

``` bash
npm config set proxy http://proxy.com:port --global
npm install jshint --global
```

## memo

cygwinでctagsを使うときはExuburantCtagsを使わないとうまく行かなそう  

## todo

[Chef_work]: https://github.com/kagerouttepaso/chef_work "#:title"
[Linux_Shell_Extension]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download "シンボリックリンクを貼れるイカスソフト"
[Font_Install]: https://github.com/kagerouttepaso/dotfiles/blob/master/font/README.md "Fontのインストール"
[MinGW_Download]: http://sourceforge.net/projects/mingw/files/ "mingw_download"
[Kaoriya_Gvim_Download]: http://www.kaoriya.net/software/vim/ "Download Kaoriya Gvim"
[unite-everything_install]: https://github.com/sgur/unite-everything "unite-everythingのインストール"
[Nodejs_HomePage]: http://nodejs.org/ "nodejsのホームページ"
[link_mingw_64_download]:http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/4.9.0/threads-posix/seh/x86_64-4.9.0-release-posix-seh-rt_v3-rev1.7z/download "mingw64のダウンロード"
[link_msys_windows_download]:http://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download "msysのダウンロード"
[link_download_pt]: https://github.com/monochromegane/the_platinum_searcher "the platinum servher"
[link_github_rtags]: https://github.com/Andersbakken/rtags "rtags github repo"
[link_pandoc_releace]: https://github.com/jgm/pandoc/releases "download pandoc"

## OSS

- ./vscode\github-markdown.css
  MIT : https://github.com/sindresorhus/github-markdown-css