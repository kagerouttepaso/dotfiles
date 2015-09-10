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

"<space>j, <space>kで画面送り
"noremap <Space>j <C-f>
"noremap <Space>k <C-b>

"フレームサイズを怠惰に変更する
map      <kPlus>  <C-W>+
map      <kMinus> <C-W>-
nnoremap +        <C-W>+
nnoremap -        <C-W>-

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

"" 最後に変更されたテキストを選択する
"nnoremap gc `[v`]
"vnoremap gc <C-u>normal gc<Enter>
"onoremap gc <C-u>normal gc<Enter>

" カーソル位置の単語をyankする
"nnoremap vy vawy

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <BS> <C-w>h

" insert mode でjjでesc
inoremap jj <Esc>
