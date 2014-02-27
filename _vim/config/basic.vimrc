"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
"set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
"set modelines=0                  " モードラインは無効

" OSのクリップボードを使用する
set clipboard+=unnamed,unnamedplus,autoselect
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
"挿入モードでCtrl+pを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <C-r>0
"選択モード中にCtrl+pで選択している場所を削除してコピーしていた文章を貼り付け
"vnoremap <C-p> di<C-r>0<Esc>
"エンターキーで改行
"nnoremap <Enter> o <Esc>v^d
nnoremap <C-q> :Kwbd<CR>

"スペースで次のバッファへ、bで前のバッファへ
noremap <Space> :bn<CR>
noremap B :bp<CR>

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

" 画面点滅させない
set novisualbell
if has("win32")
  set vb t_vb=
endi
if has("win64")
  set vb t_vb=
endi

"香り屋版のvimrcを読み込まない
let g:gvimrc_local_finish=1
let g:vimrc_local_finish=1
