"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------
" set tags
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
  set autochdir
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

set notagbsearch

"<C-t>はscreentとかぶるので削除
"tab pagesを使い易くする
" nnoremap <C-t>  <Nop>
" nnoremap <C-t>n  ;<C-u>tabnew<CR>
" nnoremap <C-t>c  ;<C-u>tabclose<CR>
" nnoremap <C-t>o  ;<C-u>tabonly<CR>
" nnoremap <C-t>j  ;<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
" nnoremap <C-t>k  gT

"tags-and-searchesを使い易くする
nnoremap t  <Nop>
"「飛ぶ」
nnoremap tt  g<C-]>
"「戻る」
nnoremap tb  :<C-u>Kwbd<CR>:pop<CR>
"tags 作成"
if g:is_windows
  command! Ctags :!ctags -R .<CR>
endif

