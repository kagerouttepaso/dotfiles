"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------

set showmatch    " 括弧の対応をハイライト
set number       " 行番号表示
set list         " 不可視文字表示
set cursorline   " カーソル行をハイライト
set display=uhex " 印字不可能文字を16進数で表示
set lazyredraw   " コマンド実行中は再描画しない
set ttyfast      " 高速ターミナル接続を行う
set novisualbell " 画面点滅させない

set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式

" 全角スペースの表示
augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,ColorScheme      * highlight ZenkakuSpace cterm=underline ctermfg=lightblue gui=underline guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match ZenkakuSpace /　/
augroup END

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave         * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
