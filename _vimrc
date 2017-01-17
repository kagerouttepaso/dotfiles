"日本語

" runtimepathの検索
if isdirectory($HOME."/.vim")
  let $DOTVIM_DIR = $HOME."/.vim"
elseif isdirectory($HOME."/vimfiles")
  let $DOTVIM_DIR = $HOME."/vimfiles"
elseif isdirectory($HOME."/dotfiles/_vim")
  let $DOTVIM_DIR = $HOME."/dotfiles/_vim"
endif
set encoding=utf-8    " デフォルトエンコーディング
let g:dotvim_dir=$DOTVIM_DIR

"デバッグ用 messageの出力をコピー
command! MessCopy call s:messcopy()
function! s:messcopy()
  redir @+>
  silent messages
  redir END
  " Copy to selection too.
  call setreg('*', getreg('+', 1), getregtype('+'))
endfunction

"Evでvimrcの編集
command! Ev edit $MYVIMRC

"NeoBundle用の条件判断用の設定
"windowsかどうかの判定
let g:is_windows             = has('win32') || has('win64')
"cygwinかどうかの判定
let g:is_cygwin              = has('win32unix')
"macかどうかの判定
let g:is_mac                 = !g:is_windows
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!isdirectory('/proc') && executable('sw_vers')))
let g:is_gui                 = has('gui')
"Luaが使用可能かどうかの判定
let g:is_can_use_neocomplete = has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
"tmuxがambiwidthを使用しない設定で起動していた時
let g:is_teraterm=$TMUX_POWERLINE_NOT_USE_AMBIWIDTH == "true"
"markdownのCSSファイルパス
let g:markdown_css_filt_path=dotvim_dir. "/css/default.css"
let g:markdown_dox_filt_path=dotvim_dir. "/css/reference.docx"
let g:qiita_css_filt_path=dotvim_dir. "/css/qiita.css"

"NeoBundleで管理してるpluginを読み込む
source $DOTVIM_DIR/config/bundle.vimrc
"基本設定
source $DOTVIM_DIR/config/basic.vimrc
"StatusLine設定
source $DOTVIM_DIR/config/statusline.vimrc
"インデント設定
source $DOTVIM_DIR/config/indent.vimrc
"表示関連
source $DOTVIM_DIR/config/apperance.vimrc
"補完関連
source $DOTVIM_DIR/config/completion.vimrc
"Tags関連
source $DOTVIM_DIR/config/tags.vimrc
"検索関連
source $DOTVIM_DIR/config/search.vimrc
"移動関連
source $DOTVIM_DIR/config/moving.vimrc
"編集関連
source $DOTVIM_DIR/config/editing.vimrc
"エンコーディング関連
source $DOTVIM_DIR/config/encoding.vimrc
"その他 (自作のSyntax登録など)
source $DOTVIM_DIR/config/misc.vimrc
"tab周りの設定
source $DOTVIM_DIR/config/tab.vimrc
"Color関連
source $DOTVIM_DIR/config/colors.vimrc
