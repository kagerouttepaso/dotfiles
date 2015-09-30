"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" Tabキーを空白に変換
set expandtab
" Shift+TabでTabを挿入
inoremap <S-Tab> <C-V><Tab>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" y0で行末までヤンク
nmap y0 y$
" y9で行頭までヤンク
nmap y9 y^

"挿入モードでCtrl+pを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <C-r>0

"選択モード中にCtrl+pで選択している場所を削除してコピーしていた文章を貼り付け
vnoremap <C-p> c<C-r>0<Esc>

"エンターキーで改行
nnoremap <Enter> o <Esc>

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" quickfixウィンドウではq/ESCで閉じる
augroup closeQuickfixWindow
  autocmd!
  autocmd FileType qf nnoremap <buffer> q :ccl<CR>
  autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>
augroup END

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" 行末の空白を除去する
function! BufWriteFile()
  if (&filetype == "markdown")
    "markdownは改行を考慮して処理
    let pos = getpos(".")
    :%s/\([^ ]\)  $/\1{{line_feed_code}}/ge
    :%s/\s\+$//ge
    :%s/{{line_feed_code}}$/  /ge
    call setpos(".", pos)
  else
    ":%s/\s\+$//ge
  endif
endfunction
augroup autoReplaseOnSave
  autocmd!
  autocmd BufWritePre * :call BufWriteFile()
augroup END

