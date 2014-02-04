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
<C-p>     |貼付け
<C-j>     |<Down>
<C-k>     |<Up>
<C-h>     |<Left>
<C-l>     |<Right>
jj        |<esc>
,         |,<Space>


**ノーマルモード**  

command   |mean
:--       |:--
スペース  |次のバッファへ
b         |前のバッファへ
<C-g><C-g>|カーソル下の単語をバッファを対象にGrep
<C-g><C-r>|カーソル下の単語をカレントフォルダから再帰的にGrep
tt        |タグジャンプ
tb        |現在開いているバッファを閉じてタグスタックをひとつ戻す
Ctags     |:!ctags -R
0         |行末へ
9         |行頭へ
+         |フレームサイズ増加
-         |フレームサイズ減少
gb        |最後に編集された位置に移動
(         |対応するカッコに移動
)         |対応するカッコに移動
vy        |カーソル位置の単語をヤンク
<C-j>     |<C-w>j
<C-k>     |<C-w>k
<C-l>     |<C-w>l
<C-h>     |<C-w>h
t1~t9     |対応したタブ番号へ飛ぶ
tn        |次のタブへ
tp        |前のタブへ
tr        |バッファをタブ展開

**ビジュアルモード**  

command   |mean
:--       |:--
0         |行末へ
v         |行末へ
9         |行頭へ

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

**Unite**  
Grepの検索エンジンにはagが使えればそちらを使う  

command   |mean
:--       |:--
f         |[unite]
[unite]u  |`<C-u>Unite -no-split<Space>`
[unite]a  |全部乗せ`<C-u>Unite -buffer-name=all buffer file_mru bookmark file grep`. find`.<CR><C-r><C-w><CR>*<C-r><C-w>*<CR>
[unite]b  |バッファ一覧`<C-u>Unite buffer<CR>
[unite]h  |最近使用したファイル一覧`<C-u>Unite buffer file_mru<CR>
[unite]d  |カレントディレクトリからファイル一覧`<C-u>Unite -buffer-name=files file<CR>
[unite]c  |現在のバッファのカレントディレクトリからファイル一覧`<C-u>UniteWithBufferDir -buffer-name=files file<CR>
[unite]r  |レジスタ一覧`<C-u>Unite register<CR>
[unite]g  |グレップ検索`<C-u>UniteWithCursorWord grep`. -buffer-name=serch-buffer<CR>
[unite]f  |ファイル検索`<C-u>Unite find`. -buffer-name=serch-file<CR>*<C-r><C-w>*<CR>
[unite]s  |`<C-u>Unite source<CR>

memo
----
cygwinでctagsを使うときはExuburantCtagsを使わないとうまく行かなそう


[Chef_work]: https://github.com/kagerouttepaso/chef_work "#:title"
[Linux_Shell_Extension]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download "シンボリックリンクを貼れるイカスソフト"
[Font_Install]: https://github.com/kagerouttepaso/dotfiles/blob/master/font/README.md "Fontのインストール"
