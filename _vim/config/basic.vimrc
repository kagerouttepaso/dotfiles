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
"set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set noendofline                  " ファイル末尾に改行を追加しない

if g:is_teraterm
  set ambiwidth=double           " terateamはdoubleじゃないと化ける
elseif g:is_mac
  set ambiwidth=single           " macは開発業務でしか使わないのでsingle
elseif g:is_windows
  set ambiwidth=double           " windowsはメールのテキスト編集を考えdouble
elseif g:is_cygwin
  set ambiwidth=double           " cygwinは使うフォント(cica)の関係でdoubleでまとめてある
endif

" OSのクリップボードを使用する
if g:is_mac
  set clipboard=autoselect
else
  set clipboard=unnamed,unnamedplus,autoselect
endif

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" undoファイルの格納場所
set undofile
set undodir=$DOTVIM_DIR/undo

"ヘルプファイルの場所
set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"香り屋版のvimrcを読み込まない
let g:gvimrc_local_finish=1
let g:vimrc_local_finish=1

" 今開いているファイルのパスをカレントディレクトリと設定する
command! CdCurrent :cd %:p:h

