" runtimepathの検索
if isdirectory($HOME."/.vim")
  let $DOTVIM_DIR = $HOME."/.vim"
elseif isdirectory($HOME."/vimfiles")
  let $DOTVIM_DIR = $HOME."/vimfiles"
elseif isdirectory($HOME."/dotfiles/_vim")
  let $DOTVIM_DIR = $HOME."/dotfiles/_vim"
endif
set encoding=utf-8    " デフォルトエンコーディング

command! MessCopy call s:messcopy()
function! s:messcopy()
    redir @+>
    silent messages
    redir END
    " Copy to selection too.
    call setreg('*', getreg('+', 1), getregtype('+'))
endfunction

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
"Color関連
source $DOTVIM_DIR/config/colors.vimrc
"編集関連
source $DOTVIM_DIR/config/editing.vimrc
"エンコーディング関連
source $DOTVIM_DIR/config/encoding.vimrc
"その他 (自作のSyntax登録など)
source $DOTVIM_DIR/config/misc.vimrc
"tab周りの設定
source $DOTVIM_DIR/config/tab.vimrc
