"-------------------------------------------------------------------------------
" プラグインごとの設定 Plugins
"-------------------------------------------------------------------------------


"------------------------------------
" Fugitive.vim
"------------------------------------
"nnoremap <Space>gd :<C-u>Gdiff<Enter>
"nnoremap <Space>gs :<C-u>Gstatus<Enter>
"nnoremap <Space>gl :<C-u>Glog<Enter>
"nnoremap <Space>ga :<C-u>Gwrite<Enter>
"nnoremap <Space>gc :<C-u>Gcommit<Enter>
"nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
"nnoremap <Space>gb :<C-u>Gblame<Enter>


"------------------------------------
" BufExplorer
"------------------------------------
"<Leader>l<Space>でBufferList
"nnoremap <Leader>l<Space> :BufExplorer<CR>


"------------------------------------
" DumbBuf.vim
"------------------------------------
"<Leader>b<Space>でBufferList
"let dumbbuf_hotkey = '<Leader>b<Space>'
"let dumbbuf_mappings = {
"    \ 'n': {
"        \'<Esc>': { 'opt': '<silent>', 'mapto': ':<C-u>close<CR>' }
"    \}
"\}
"let dumbbuf_single_key  = 1
"let dumbbuf_updatetime  = 1    " &updatetimeの最小値
"let dumbbuf_wrap_cursor = 0
"let dumbbuf_remove_marked_when_close = 1

"------------------------------------
" vim-indent-guides
"------------------------------------
"nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 4
"let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"if 'dark' == &background
"    hi IndentGuidesOdd  ctermbg=black
"    hi IndentGuidesEven ctermbg=darkgrey
"else
"    hi IndentGuidesOdd  ctermbg=white
"    hi IndentGuidesEven ctermbg=lightgrey
"endif

"------------------------------------
" gundo.Vim
"------------------------------------
" nmap U :<C-u>GundoToggle<CR>


"------------------------------------
" open-blowser.vim
"------------------------------------

" カーソル下のURLをブラウザで開く
"nmap <Leader>fu <Plug>(openbrowser-open)
"vmap <Leader>fu <Plug>(openbrowser-open)
" カーソル下のキーワードをググる
"nnoremap <Leader>fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" operator-camelize.vim
"------------------------------------
" camel-caseへの変換
"map <Leader>u <Plug>(operator-camelize)
"map <Leader>U <Plug>(operator-decamelize)

"------------------------------------
" operator-replace.vim
"------------------------------------
" RwなどでYankしてるもので置き換える
"map R <Plug>(operator-replace)

"------------------------------------
" sumartword.vim
"------------------------------------
"noremap ,w  w
"noremap ,b  b
"noremap ,e  e
"noremap ,ge  ge
"
"map W  <Plug>(smartword-w)
"map B  <Plug>(smartword-b)
"map E  <Plug>(smartword-e)
"map ge  <Plug>(smartword-ge)


"------------------------------------
" camelcasemotion.vim
"------------------------------------

" <Shift-wbe>でCameCaseやsnake_case単位での単語移動
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
" text-objectで使用できるように
"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

"------------------------------------
" errormarker.vim
"------------------------------------
" disable default shortcut mapping and re-define to <Leader>ec
"let g:errormarker_disablemappings = 1
"nmap <silent> <unique> <Leader>ec :ErrorAtCursor<CR>

"------------------------------------
" vimshell
"------------------------------------
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
"let g:vimshell_enable_smart_case = 1
"
"if has('win32') || has('win64')
"  " Display user name on Windows.
"  let g:vimshell_prompt = $USERNAME."% "
"else
"  " Display user name on Linux.
"  let g:vimshell_prompt = $USER."% "
"
"  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
"  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
"  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
"  call vimshell#set_execute_file('tgz,gz', 'gzcat')
"  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
"endif
"
"function! g:my_chpwd(args, context)
"  call vimshell#execute('echo "chpwd"')
"endfunction
"function! g:my_emptycmd(cmdline, context)
"  call vimshell#execute('echo "emptycmd"')
"  return a:cmdline
"endfunction
"function! g:my_preprompt(args, context)
"  call vimshell#execute('echo "preprompt"')
"endfunction
"function! g:my_preexec(cmdline, context)
"  call vimshell#execute('echo "preexec"')
"
"  if a:cmdline =~# '^\s*diff\>'
"    call vimshell#set_syntax('diff')
"  endif
"  return a:cmdline
"endfunction
"
"autocmd FileType vimshell
"\ call vimshell#altercmd#define('g', 'git')
"\| call vimshell#altercmd#define('i', 'iexe')
"\| call vimshell#altercmd#define('l', 'll')
"\| call vimshell#altercmd#define('ll', 'ls -l')
"\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
"\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
"\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
"\| call vimshell#hook#set('preexec', ['g:my_preexec'])
"
"command! Vs :VimShell
"
"
"------------------------------------
" quickrun.vim
"------------------------------------
"let g:quickrun_config = {}
"let g:quickrun_config._ = {'runner' : 'vimproc'}
"let g:quickrun_config['rspec/bundle'] = {
"  \ 'type': 'rspec/bundle',
"  \ 'command': "rspec",
"  \ 'cmdopt': "-l %{line('.')}",
"  \ 'exec': "bundle exec %c %o %s ",
"  \ 'filetype': 'rspec-result'
"  \}
"let g:quickrun_config['rspec/normal'] = {
"  \ 'type': 'rspec/normal',
"  \ 'command': "rspec",
"  \ 'cmdopt': "-l %{line('.')}",
"  \ 'exec': '%c %o %s',
"  \ 'filetype': 'rspec-result'
"  \}
"function! RSpecQuickrun()
"  let b:quickrun_config = {'type' : 'rspec/bundle'}
"endfunction
"autocmd BufReadPost *_spec.rb call RSpecQuickrun()
"
"let g:quickrun_config.markdown = {
"      \ 'outputter' : 'null',
"      \ 'command'   : 'open',
"      \ 'cmdopt'    : '-a',
"      \ 'args'      : 'Marked',
"      \ 'exec'      : '%c %o %a %s',
"      \}
"let g:quickrun_config.html = {
"      \ 'outputter' : 'null',
"      \ 'command'   : 'open',
"      \ 'exec'      : '%c %s',
"      \}
"------------------------------------
" Pydiction
"------------------------------------
"let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"------------------------------------
" Syntastic
"------------------------------------
" エラー行をsignで表示する
"let g:syntastic_enable_signs = 1
" 可能ならhighligt表示する
"let g:syntastic_enable_highlighting = 1

"------------------------------------
" toggle.vim
"------------------------------------
"imap <C-A> <Plug>ToggleI
"nmap <C-A> <Plug>ToggleN
"vmap <C-A> <Plug>ToggleV
"
"let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'unless', 'unless':'if', 'yes':'no', 'no':'yes', 'enable':'disable', 'disable':'enable', 'pick':'reword', 'reword':'fixup', 'fixup':'squash', 'squash':'edit', 'edit':'exec', 'exec':'pick' }
"
"

"------------------------------------
" vim-rails.vim
"------------------------------------
"let g:rails_some_option = 1
"let g:rails_level = 4
"let g:rails_syntax = 1
"let g:rails_statusline = 1
"let g:rails_url='http://localhost:3000'
"let g:rails_subversion=0
"" let g:dbext_default_SQLITE_bin = 'mysql2'
"let g:rails_default_file='config/database.yml'
"" let g:rails_ctags_arguments = ''
"function! SetUpRailsSetting()
"  nmap <buffer><C-C> <Nop>
"  imap <buffer><C-C> <Nop>
"  map <buffer><C-_><C-C> <Nop>
"
"  nmap <buffer><Space>r :R<CR>
"  nmap <buffer><Space>a :A<CR>
"  nmap <buffer><Space>m :Rmodel<Space>
"  nmap <buffer><Space>c :Rcontroller<Space>
"  nmap <buffer><Space>v :Rview<Space>
"  nmap <buffer><Space>s :Rspec<Space>
"  nmap <buffer><Space>p :Rpreview<CR>
"  nmap <buffer><Space>t :Runittest<CR>
"  au FileType ruby,eruby,ruby.rspec let g:neocomplcache_dictionary_filetype_lists = {
"        \'ruby' : $HOME.'/.vim/dict/rails.dict',
"        \'eruby' : $HOME.'/.vim/dict/rails.dict'
"        \}
"  setl dict+=~/.vim/dict/rails.dict
"  setl dict+=~/.vim/dict/ruby.dict
"endfunction
"autocmd User Rails call SetUpRailsSetting()




"------------------------------------
" mattn/vim-metarw-redmine
"------------------------------------
"let g:metarw_redmine_server = 'http://redmine.dev.scaleout.jp'
"let g:metarw_redmine_apikey = '2ed945f405865ec799ff91b7bb364215f932c51c'

