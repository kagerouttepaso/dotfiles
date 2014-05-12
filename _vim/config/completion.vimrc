"-------------------------------------------------------------------------------
" 補完・履歴 Complete
"-------------------------------------------------------------------------------
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

" Ex-modeでの<C-p><C-n>をzshのヒストリ補完っぽくする
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

"補完にneocomplcacheを使う
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
  " 新しく追加した neocomplete の設定
  source $DOTVIM_DIR/config/completion.neocomplete.vimrc
else
  " 今までの neocomplcache の設定
  source $DOTVIM_DIR/config/completion.neocomplcache.vimrc
endif

