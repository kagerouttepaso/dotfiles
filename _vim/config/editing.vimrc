"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
"vnoremap p d<Esc>P

" Tabキーを空白に変換
set expandtab
" Shift+TabでTabを挿入
inoremap <S-Tab> <C-V><Tab>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" :Ptでインデントモード切替
command! Pt :set paste!

" インサートモード中に<C-o>でyankした内容をputする
inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i

" y0で行末までヤンク
nmap y0 y$
" y9で行頭までヤンク
nmap y9 y^

" 括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を除去する
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

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" foldは各FiltTypeにお任せる
" set foldmethod=syntax
" 折りたたみは全て展開した状態で開始する
" set foldlevelstart=99
" .vimはmarker
" autocmd FileType vim :set foldmethod=marker

" <leader>j でJSONをformat
" http://wozozo.hatenablog.com/entry/2012/02/08/121504
map <Leader>j !python -m json.tool<CR>

" quickfixウィンドウではq/ESCで閉じる
augroup closeQuickfixWindow
  autocmd!
  autocmd FileType qf nnoremap <buffer> q :ccl<CR>
  autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>
augroup END

" cwでquickfixウィンドウの表示をtoggleするようにした
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>


nnoremap <C-S> <C-A>
