"------------------------------------
" neocomplete.vim
"------------------------------------
" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" neocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_keyword_length = 3
" neocompleteを自動的にロックするバッファ名のパターン
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 2
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
"let g:neocomplete#enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
"let g:neocomplete#max_list = 30

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scala' : $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
    \ 'c' : $HOME.'/.vim/dict/c.dict',
    \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'lua' : $HOME.'/.vim/dict/lua.dict',
    \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
    \ 'vim' : $HOME.'/.vim/dict/vim.dict'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" 補完を選択しpopupを閉じる
inoremap <expr><C-y>  neocomplete#close_popup()
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

augroup neocompleteKeyBind
  autocmd!
  " buffer開いたらneoconでcache
  autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
  " Enable omni completion.
  " FileType毎のOmni補完を設定
  autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType c          setlocal omnifunc=ccomplete#Complete
  autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"インクルードパスの指定
if has("win32") || has("win64")
  let g:neocomplete#sources#include#paths ={
        \ 'cpp'  : '.,C:/MinGW//include',
        \ 'c'    : '.,C:/MinGW//include',
        \ 'ruby' : '.,C:/Ruby200/lib/ruby/2.0.0/',
        \ }
else
  let g:neocomplete#sources#include#paths ={
        \ 'cpp'  : '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
        \ 'c'    : '.,/usr/include',
        \ 'ruby' : '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
        \ }
endif

"インクルード文のパターンを指定
let g:neocomplete#sources#include#patterns = {
  \ 'cpp' : '^\s*#\s*include',
  \ 'c' : '^\s*#\s*include',
  \ 'ruby' : '^\s*require',
  \ 'perl' : '^\s*use',
  \ }
"インクルード先のファイル名の解析パターン
let g:neocomplete#sources#include#exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }

" for rsense
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/src/rsense-0.3')
