"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
"Escの2回押しでハイライト消去
"nmap <ESC><ESC> :nohlsearch<CR><ESC>

"選択した文字列を検索
"vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
"vnoremap /r "xy;%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

"s*置換後文字列/g<Cr>でカーソル下のキーワードを置換
"nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
"nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
"nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg patches'
let Grep_Skip_Files = '*.bak *~ tags *.pe32 *.efi *.pdb *.obj *.map *.lib *.dll *.sec *.Fv *.dummy *.ffs *.idb'

