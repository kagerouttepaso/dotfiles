"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap j gj
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up>   gk

" gl, ghでGitの差分に飛ぶ
nnoremap <silent> gl :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> gh :<C-u>GitGutterPrevHunk<CR>


" 0, 9で行頭、行末へ
nnoremap 9 ^
nnoremap 0 $
vnoremap 9 ^
vnoremap 0 $

" insert mode での移動
"inoremap  <C-e> <END>
"inoremap  <C-a> <HOME>

" インサートモードでもhjklで移動（Ctrl押すけどね）
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" コマンドモードでもhlで移動（Ctrl押すけどね）
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

"<space>j, <space>kで画面送り
"noremap <Space>j <C-f>
"noremap <Space>k <C-b>

" spaceで次のbufferへ。back-spaceで前のbufferへ
"nmap <Space><Space> ;MBEbn<CR>
"nmap <BS><BS> ;MBEbp<CR>


"フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-
nnoremap + <C-W>+
nnoremap - <C-W>-

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc <C-u>normal gc<Enter>
onoremap gc <C-u>normal gc<Enter>

" カーソル位置の単語をyankする
nnoremap vy vawy

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

" git-diff-aware version of gf commands.
" http://labs.timedia.co.jp/2011/04/git-diff-aware-gf-commands-for-vim.html
"nnoremap <expr> gf  <SID>do_git_diff_aware_gf('gf')
"nnoremap <expr> gF  <SID>do_git_diff_aware_gf('gF')
"nnoremap <expr> <C-w>f  <SID>do_git_diff_aware_gf('<C-w>f')
"nnoremap <expr> <C-w><C-f>  <SID>do_git_diff_aware_gf('<C-w><C-f>')
"nnoremap <expr> <C-w>F  <SID>do_git_diff_aware_gf('<C-w>F')
"nnoremap <expr> <C-w>gf  <SID>do_git_diff_aware_gf('<C-w>gf')
"nnoremap <expr> <C-w>gF  <SID>do_git_diff_aware_gf('<C-w>gF')

"function! s:do_git_diff_aware_gf(command)
"  let target_path = expand('<cfile>')
"  if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
"    if filereadable(target_path) || isdirectory(target_path)
"      return a:command
"    else
"      " BUGS: Side effect - Cursor position is changed.
"      let [_, c] = searchpos('\f\+', 'cenW')
"      return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
"    endif
"  else
"    return a:command
"  endif
"endfunction

" insert mode でjjでesc
inoremap jj <Esc>
