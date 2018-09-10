"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------

" set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"Escの2回押しでハイライト消去
"nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg patches'
let Grep_Skip_Files = '*.bak *~ tags *.pe32 *.efi *.pdb *.obj *.map *.lib *.dll *.sec *.Fv *.dummy *.ffs *.idb'

