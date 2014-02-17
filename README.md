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

Windows環境
-----------
### フォントの設定
フォントのインストールを行うとかっこいいCygwin、teraterm環境を構築できる。  
インストールの仕方は[Help][Font_Install]を参照  

### Cygwin
Windows環境でも基本的に必要パッケージをインストールして**やること**のコマンドを入れれば問題ない。  
x11のパッケージセットをインストールすればssh接続先のクリップボードの共有もできる用になっています  

####入れるパッケージ
- git
- zsh
- ctags
- x11すべて
- curl
- openssh


### teraterm
[設定ファイル](./windows/TERATERM.INI) を読みこめばいい感じになる  

### 香り屋版Gvimへの対応
1. [MinGw][Mingw_download]をダウンロードしてインストール。  
   更にパスを通しておく（デフォルトの場合は`C:/MinGW/bin`と`C:/MinGW/msys/1.0/bin`になる)
   もし、cygwinにパスを通している場合は、
   minGWをcygwinより先にパス指定しておかないと、vimprocとかがうまく動かないような気がする
2. Source Treeをダウンロードしてインストール、この`Dotfiles`を好きなところにCloneしてくる。  
3. `C:\Users\UserName`以下に、dotfileのファイルを下記の表のとおりにシンボリックリンクをはりつける  
   `.vim`は、Windowsだと1文字目に.がつく名前をしてできないので、Cygwinを使ってリネームする  
   シンボリックリンクを貼るのには[このアプリ][Linux_shell_extension]を使用するといい感じです
4. Windows上のファイル検索にはunite-everythingを使うので、その準備を行う。  
   手順は[unite-everythingのヘルプ][unite-everything_install]を参照
5. [香り屋版Gvim][Kaoriya_gvim_download]をダウンロードして起動。  
   ここで色々エラーが出るけど気にしない。
   ﾌﾟﾗｷﾞﾝのインストールするか聞かれるけどNOを選択。  
   `:NeobundleInstall`でプラグインをインストール!!
6. 快適なGvimライフへようこそ  
   当然上のフォントの設定はしておくこと

Windows上だとrgrepがうまく動かないのでUniteGrepを使ってください

dotfiles    | `C:\Users\UserName`
:--         |:--
`./_vimrc`  | `_vimrc`
`./_gvimrc` | `_gvimrc`
`./_vim`    | `.vim`

コマンド
--------
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
* バックアップ取らない
* スワップ作らない
* バックスペースで色々消せる
* ビープ音鳴らさない
* モードを表示
* マウスを使用する
* クリップボードを使用する
* 全角スペースを表示
* tagsファイルは6回階層上のものまで読み込む
* 前回終了したカーソル行に移動
* 補完にはNeocomplateを使用するが、使えない時はNeocomplecacheを使う

#### 拡張コマンド
**挿入モード**  

command   |mean
:--       |:--
`<C-p>`     |貼付け
`<C-j>`     |`<Down>`
`<C-k>`     |`<Up>`
`<C-h>`     |`<Left>`
`<C-l>`     |`<Right>`
`jj`        |`<esc>`
`,`         |`,<Space>`


**ノーマルモード**  

command      |mean
:--          |:--
`<Space>`    |次のバッファへ
`b`          |前のバッファへ
`<C-g><C-g>` |カーソル下の単語をバッファを対象にGrep
`<C-g><C-r>` |カーソル下の単語をカレントフォルダから再帰的にGrep
`Ctags`      |:!ctags -R
`tt`         |タグジャンプ
`tb`         |現在開いているバッファを閉じてタグスタックをひとつ戻す
`t1~t9`      |対応したタブ番号へ飛ぶ
`tn`         |次のタブへ
`tp`         |前のタブへ
`tr`         |バッファをタブ展開
`0`          |行末へ
`9`          |行頭へ
`+`          |フレームサイズ増加
`-`          |フレームサイズ減少
`(`          |対応するカッコに移動
`)`          |対応するカッコに移動
`vy`         |カーソル位置の単語をヤンク
`<C-j>`      |`<C-w>j`
`<C-k>`      |`<C-w>k`
`<C-l>`      |`<C-w>l`
`<C-h>`      |`<C-w>h`
`gl`         |`:GitGutterNextHunk`
`gh`         |`:GitGutterPrevHunk`
`<C-p>`      |ペーストするレジスタを一つ古いものにする(ペーストした直後のみ)
`<C-n>`      |ペーストするレジスタを一つ新しいものにする(ペーストした直後のみ)
`ss`         |置換開始
`sw`         |カーソル以下の単語を置換


**ビジュアルモード**  

command     |mean
:--         |:--
`0`         |行末へ
`v`         |行末へ
`9`         |行頭へ
`sw`        |文書全体で、選択した文章を置換
`ss`        |選択した範囲を置換

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

command   |mean
:--       |:--
f         |[unite]
[unite]u  |`<C-u>Unite -no-split<Space>`
[unite]a  |全部乗せ`<C-u>Unite -buffer-name=all buffer file_mru bookmark file grep:. find:.<CR><C-r><C-w><CR>*<C-r><C-w>*<CR>`
[unite]b  |バッファ一覧`<C-u>Unite buffer<CR>`
[unite]h  |最近使用したファイル一覧`<C-u>Unite buffer file_mru<CR>`
[unite]d  |カレントディレクトリからファイル一覧`<C-u>Unite -buffer-name=files file<CR>`
[unite]c  |現在のバッファのカレントディレクトリからファイル一覧`<C-u>UniteWithBufferDir -buffer-name=files file<CR>`
[unite]r  |レジスタ一覧`<C-u>Unite register<CR>`
[unite]g  |グレップ検索`<C-u>Unite grep:. -buffer-name=serch-buffer -no-quit<CR><C-r><C-w><CR>`
[unite]f  |ファイル検索(win以外)`<C-u>Unite find:. -buffer-name=serch-file -no-quit<CR>*<C-r><C-w>*<CR>`
[unite]f  |ファイル検索(win) **日本語が文字化けしてしまう…**<`2`>`<C-u>UniteWithCursorWord everything/async -no-quit<CR>`
[unite]s  |ソースリスト`<C-u>Unite source<CR>`
[unite]o  |アウトラインを展開`<C-u>Unite outline -vertical -buffer-name=outline -no-start-insert<CR>`

### teratermとscreen
キーバインドを変更してある。とりあえず[tmux.conf](./_tmux.conf)と[screenrc](./_screenrc)を見てください。  
バインドはteratermが`Ctrl+o`screenが`ctrl+a`にバインドされてます

memo
----
cygwinでctagsを使うときはExuburantCtagsを使わないとうまく行かなそう

todo
----



[Chef_work]: https://github.com/kagerouttepaso/chef_work "#:title"
[Linux_Shell_Extension]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download "シンボリックリンクを貼れるイカスソフト"
[Font_Install]: https://github.com/kagerouttepaso/dotfiles/blob/master/font/README.md "Fontのインストール"
[MinGW_Download]: http://sourceforge.net/projects/mingw/files/ "mingw_download"
[Kaoriya_Gvim_Download]: http://www.kaoriya.net/software/vim/ "Download Kaoriya Gvim"
[unite-everything_install]: https://github.com/sgur/unite-everything "unite-everythingのインストール"
