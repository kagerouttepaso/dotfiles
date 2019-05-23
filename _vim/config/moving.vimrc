"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h      <Left>
nnoremap j      gj
nnoremap k      gk
nnoremap l      <Right>
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap j      gj
vnoremap k      gk
vnoremap <Down> gj
vnoremap <Up>   gk

" 0, 9で行頭、行末へ
nnoremap 9 ^
nnoremap 0 $
vnoremap 9 ^
vnoremap 0 $

" インサートモードでもhlで移動（Ctrl押すけどね）
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" コマンドモードでもhlで移動（Ctrl押すけどね）
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

"スペースで次のバッファへ、bで前のバッファへ
nnoremap <leader>n  :bn<CR>
nnoremap <leader>b  :bp<CR>

"フレームサイズを怠惰に変更する
map      <kPlus>  <C-W>+
map      <kMinus> <C-W>-
nnoremap +        <C-W>+
nnoremap -        <C-W>-

" 前回終了したカーソル行に移動
augroup BufReadPost_
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" leader+hjklでウィンドウ移動
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" insert mode でjjでesc
inoremap jj <Esc>
