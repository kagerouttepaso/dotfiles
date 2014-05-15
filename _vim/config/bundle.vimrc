if has('vim_starting')
  set nocompatible  " Be iMproved
  set runtimepath+=$DOTVIM_DIR/bundle/neobundle.vim/
endif
call neobundle#begin(expand($DOTVIM_DIR.'/bundle'))
"NeoBundle用の条件判断用の設定
let g:is_windows = has('win32') || has('win64')
let g:is_can_use_neocomplete = has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc : vimから非同期実行
if g:is_windows
  " win環境は香り屋バンドル版を使う
else
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
endif

" Completion {{{
" 補完 neocomplete.vim : 究極のVim的補完環境
if g:is_can_use_neocomplete
  NeoBundleLazy 'Shougo/neocomplete.vim', { 'depends' : [ 'Shougo/neosnippet.vim' ] }
  if neobundle#tap('neocomplete.vim') "{{{
    call neobundle#config({
          \  'autoload' : {
          \    'insert' : 1,
          \    'on_source'    : ['neosnippet.vim'],
          \  }
          \})
    function! neobundle#hooks.on_source(bundle)
      source $DOTVIM_DIR/config/completion.neocomplete.vimrc
    endfunction
    call neobundle#untap()
  endif "}}}
else
  " 今までの neocomplcache の設定
  NeoBundle 'Shougo/neocomplcache.vim', { 'depends' : [ 'Shougo/neosnippet.vim' ] }
  source $DOTVIM_DIR/config/completion.neocomplcache.vimrc
endif


" neocomplcacheのsinpet補完
NeoBundleLazy 'Shougo/neosnippet.vim'
if neobundle#tap('neosnippet.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'insert'       : 1,
        \    'filetypes'    : ['nsnippet'],
        \    'commands'     : ['NeoSnippetEdit', 'NeoSnippetSource'],
        \    'unite_source' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
    " ユーザー定義スニペット保存ディレクトリ
    let g:neosnippet#snippets_directory=expand($DOTVIM_DIR.'/snippets')
  endfunction
  " Plugin key-mappings.
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> pumvisible() ?
        \ "\<C-n>" : neosnippet#jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \ : "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  call neobundle#untap()
endif "}}}

NeoBundle 'Shougo/neosnippet-snippets'
" }}}

" Edit {{{
" 改造したmonday.vim Ctrl+a or Ctrl+x の大幅な拡張
NeoBundleLazy 'kagerouttepaso/monday'  
if neobundle#tap('monday') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'  : [ 'call' ], 
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

"単語を色付けすることができる
NeoBundleLazy 't9md/vim-quickhl'
if neobundle#tap('vim-quickhl') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'mappings'     : ['<Plug>(quickhl-'],
        \  }
        \})
  nmap gm <Plug>(quickhl-manual-this)
  xmap gm <Plug>(quickhl-manual-this)
  nmap gM <Plug>(quickhl-manual-reset)
  xmap gM <Plug>(quickhl-manual-reset)
  nmap gj <Plug>(quickhl-cword-toggle)
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" }}}

" Searching/Moving{{{
" grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
NeoBundleLazy 'grep.vim'
if neobundle#tap('grep.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['Grep', 'Rgrep', 'Fgrep', 'Rfgrep', 'Egrep', 'Regrep', 'Agrep', 'Ragrep'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" open-browser.vim : カーソルの下のURLを開くor単語を検索エンジンで検索
NeoBundleLazy 'tyru/open-browser.vim'
if neobundle#tap('open-browser.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['OpenBrowser', 'OpenBrowserSearch'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}


" }}}

" Programming {{{
" quickrun.vim : 編集中のファイルを簡単に実行できるプラグイン
NeoBundleLazy 'thinca/vim-quickrun'
if neobundle#tap('vim-quickrun') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['QuickRun'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" vim-ruby : VimでRubyを扱う際の最も基本的な拡張機能
NeoBundleLazy 'vim-ruby/vim-ruby'
if neobundle#tap('vim-ruby') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'filetypes'    : ['ruby'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}


" ソースコード上のメソッド宣言、変数宣言の一覧を表示
NeoBundleLazy 'taglist.vim'
if neobundle#tap('taglist.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['Tlist'],
        \  }
        \})
  map <silent><leader>tl       :Tlist<CR>        " taglistを開くショットカットキー
  function! neobundle#hooks.on_source(bundle)
    "let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags' " ctagsのパス
    let Tlist_Show_One_File      = 1     " 現在編集中のソースのタグしか表示しない
    let Tlist_Exit_OnlyWindow    = 1     " taglistのウィンドーが最後のウィンドーならばVimを閉じる
    "let Tlist_Use_Right_Window = 1      " 右側でtaglistのウィンドーを表示h
    let Tlist_Enable_Fold_Column = 1     " 折りたたみ
    "let Tlist_Auto_Open = 1             " 自動表示
    let Tlist_Auto_Update        = 1
    let Tlist_WinWidth           = 30
    "nmap <F7> :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>
    "nmap <Leader>tl :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>
  endfunction
  call neobundle#untap()
endif "}}}



" tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
"NeoBundle 'SrcExpl'
"let g:SrcExpl_isUpdateTags = 0         " tagsをsrcexpl起動時に自動で作成（更新）
"let g:SrcExpl_gobackKey    = "<C-SPACE>"

"" NERD_tree, taglist, srcexpl の統合
"NeoBundle 'Trinity'
"command! TA :TrinityToggleAll
"command! TN :TrinityToggleNERDTree
"command! TS :TrinityToggleSourceExplorer
"command! TT :TrinityToggleTagList
"command! TU :TrinityUpdateWindow

" NERDTree : ツリー型エクスプローラ
"NeoBundle 'The-NERD-tree'

"" vtreeexplorer.vim : ツリー状にファイルやディレクトリの一覧を表示
"NeoBundle 'vtreeexplorer'
"" 縦に表示する
"let g:treeExplVertical=1
""<Leader>t<Space>でディレクトリツリー表示
""noremap <Leader>t<Space> :VSTreeExplore<CR>
""分割したウィンドウのサイズ
"let g:treeExplWinSize=30
" }}}

" Syntax {{{
" haml
NeoBundle 'haml.zip'

" JavaScript
NeoBundle 'JavaScript-syntax'

" jQuery
NeoBundle 'jQuery'

" nginx conf
NeoBundle 'nginx.vim'

" markdown
NeoBundle 'tpope/vim-markdown'

" coffee script
NeoBundle 'kchmck/vim-coffee-script'

" python
NeoBundle 'yuroyoro/vim-python'

" scala
NeoBundle 'yuroyoro/vim-scala'

" clojure
NeoBundle 'jondistad/vimclojure'

" ghc-mod
NeoBundle 'eagletmt/ghcmod-vim'

" textile
NeoBundle 'kagerouttepaso/textile.vim'

" syntax checking plugins exist for eruby, haml, html, javascript, php, python, ruby and sass.
"NeoBundle 'scrooloose/syntastic'

" DockerFile
NeoBundle 'ekalinin/Dockerfile.vim'
" }}}

" Buffer {{{

"  Kwbd.vim : レイアウトを崩さずにバッファを削除
NeoBundleLazy 'rgarver/Kwbd.vim'
if neobundle#tap('Kwbd.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['Kwbd'],
        \  }
        \})
  "Qでバッファ閉じる
  nnoremap Q :<C-u>Kwbd<CR>
  command! QQ :call QuitBuffer()
  function! QuitBuffer()
    :Kwbd
    :quit
  endfunction
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}
" }}}

" Encording {{{

"fyletypeの自動切り替え
NeoBundleLazy 'osyo-manga/vim-precious' , { 'depends' : [ 'Shougo/context_filetype.vim' ] }
if neobundle#tap('vim-precious') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'filetypes' : ['vim', 'markdown', 'help' ],
        \    'on_source' : ['context_filetype.vim'] 
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
    let g:precious_enable_switchers = {
          \	"*" : {
          \		"setfiletype" : 0
          \	},
          \	"vim" : {
          \		"setfiletype" : 1
          \	},
          \	"help" : {
          \		"setfiletype" : 1
          \	},
          \	"markdown" : {
          \		"setfiletype" : 1
          \	},
          \}
  endfunction
  call neobundle#untap()
endif "}}}

NeoBundle 'banyan/recognize_charcode.vim'

"ソースのレイアウト修正に便利なやつ
NeoBundleLazy 'junegunn/vim-easy-align'
if neobundle#tap('vim-easy-align') "{{{
  call neobundle#config({
        \  'autoload' : {
        \  'mappings'  : [
        \    '<Plug>(EasyAlign)',
        \    '<Plug>(LiveEasyAlign)' ],
        \  }
        \})
  vmap <Enter> <Plug>(EasyAlign)
  vmap <Leader><Enter> <Plug>(LiveEasyAlign)
  nmap <Leader>a <Plug>(EasyAlign)
  nmap <Leader><Leader>a <Plug>(LiveEasyAlign)
  function! neobundle#hooks.on_source(bundle)
    let g:easy_align_delimiters = {
          \ '"': { 'pattern': '["]' },
          \ '>': { 'pattern': '>>\|=>\|>' },
          \ '/': { 'pattern': '//\+\|/\*\|\*/', 'ignore_groups': ['String'] },
          \ '#': { 'pattern': '#\+', 'ignore_groups': ['String'], 'delimiter_align': 'l' },
          \ ']': {
          \     'pattern':       '[[\]]',
          \     'left_margin':   0,
          \     'right_margin':  0,
          \     'stick_to_left': 0
          \   },
          \ ')': {
          \     'pattern':       '[()]',
          \     'left_margin':   0,
          \     'right_margin':  0,
          \     'stick_to_left': 0
          \   },
          \ 'd': {
          \     'pattern': ' \(\S\+\s*[;=]\)\@=',
          \     'left_margin': 0,
          \     'right_margin': 0
          \   }
          \ }
  endfunction
  call neobundle#untap()
endif "}}}

" }}}

" Utility {{{

" vimshell : vimのshell
NeoBundleLazy 'Shougo/vimshell'
if neobundle#tap('vimshell') "{{{
  call neobundle#config({
        \ 'autoload' : {
        \   'commands' : [ 'VimShell', 'VimShellExecute', 'VimShellInteractive',
        \                   'VimShellTerminal', 'VimShellPop'],
        \   'mappings' : ['<Plug>(vimshell_'],
        \ }
        \})
  function! neobundle#hooks.on_source(bundle)
    let g:vimshell_vimshrc_path = expand($DOTVIM_DIR.'/vimshrc')
    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
    "let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
    if has('win32') || has('win64')
      " Display user name on Windows.
      let g:vimshell_prompt = $USERNAME."% "
    else
      " Display user name on Linux.
      let g:vimshell_prompt = $USER."% "
    endif
    " Initialize execute file list.
    let g:vimshell_execute_file_list = {}
    let g:vimshell_execute_file_list['rb']    = 'ruby'
    let g:vimshell_execute_file_list['pl']    = 'perl'
    let g:vimshell_execute_file_list['py']    = 'python'
    let g:vimshell_execute_file_list['txt']   = 'vim'
    let g:vimshell_execute_file_list['vim']   = 'vim'
    let g:vimshell_execute_file_list['c']     = 'vim'
    let g:vimshell_execute_file_list['h']     = 'vim'
    let g:vimshell_execute_file_list['cpp']   = 'vim'
    let g:vimshell_execute_file_list['d']     = 'vim'
    let g:vimshell_execute_file_list['xml']   = 'vim'
    let g:vimshell_execute_file_list['java']  = 'vim'
    let g:vimshell_execute_file_list['html']  = 'gexe chrome'
    let g:vimshell_execute_file_list['xhtml'] = 'gexe chrome'
    function! VimShell_My_chpwd(args, context)
      call vimshell#execute('ls')
    endfunction
    function! VimShell_Interactive_settings()
    endfunction
    augroup bundle_vimshell
      autocmd!
      autocmd FileType int-* call VimShell_Interactive_settings()
      autocmd FileType vimshell
            \| call vimshell#hook#add('chpwd', 'my_chpwd', 'VimShell_My_chpwd')
    augroup END
  endfunction
  call neobundle#untap()
endif "}}}

" vimfiler : vimのファイラ
NeoBundleLazy 'Shougo/vimfiler' , { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('vimfiler') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['VimFiler'],
        \    'mappings'     : ['<Plug>(vimfiler_'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" vim-altercmd : Ex command拡張
"NeoBundle 'tyru/vim-altercmd'

" vim Interface to Web API
"NeoBundle 'mattn/webapi-vim'

" cecutil.vim : 他のpluginのためのutillity1
"NeoBundle 'cecutil'

" urilib.vim : vim scriptからURLを扱うライブラリ
"NeoBundle 'tyru/urilib.vim'

" ステータスラインに顔文字を表示
" NeoBundle 'mattn/hahhah-vim'

" utillity
"NeoBundle 'L9'

" Buffer管理のLibrary
"NeoBundle 'thinca/vim-openbuf'

" vimdoc 日本語
"NeoBundle 'yuroyoro/vimdoc_ja'

" vim上のtwitter client
"NeoBundle 'TwitVim'

" Lingrのclient
"NeoBundle 'tsukkee/lingr-vim'

" vimからGit操作する
NeoBundle 'tpope/vim-fugitive'

" tigよりすごいgitk的なもの
NeoBundleLazy 'gregsexton/gitv' , { 'depends' : [ 'tpope/vim-fugitive' ] }
if neobundle#tap('gitv') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['Gitv'],
        \    'on_source'    : ['vim-fugitive'],
        \  }
        \})
  " 呼び出しコマンド
  command! Tig :Gitv --all
  function! neobundle#hooks.on_source(bundle)
    "ハッシュタグの取得
    function! s:gitv_get_current_hash()
      return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
    endfunction
    "ハッシュタグの取得
    augroup setFiletypeGitv
      autocmd!
      autocmd FileType gitv call s:my_gitv_settings()
    augroup END
    function! s:my_gitv_settings()
      setlocal iskeyword+=/,-,.
      "gitv上でgitコマンドを使う
      nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
      nnoremap <buffer> <Space>me :<C-u>Git merge <C-r><C-w><CR>
      nnoremap <buffer> <Space>cp :<C-u>Git cherry-pick <C-r>=<SID>gitv_get_current_hash()<CR><CR>
      nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=<SID>gitv_get_current_hash()<CR><Space>
      nnoremap <buffer> <Space>rv :<C-u>Git revert <C-r>=<SID>gitv_get_current_hash()<CR><CR>
      nnoremap <buffer> <Space>rs :<C-u>Git reset --hard <C-r>=<SID>gitv_get_current_hash()<CR>
    endfunction
  endfunction
  call neobundle#untap()
endif "}}}

" Redmine on Vim
"NeoBundle 'mattn/vim-metarw-redmine'

" Gitの変更点をわかり易く表示
NeoBundle 'sgur/vim-gitgutter'

" Doxygenのサポーターらしい
NeoBundleLazy 'DoxygenToolkit.vim'
if neobundle#tap('DoxygenToolkit.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['Dox', 'DoxLic', 'DoxAuthor', 'DoxUndoc', 'DoxBlock'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" yankround : 副作用のないYankRing
NeoBundleLazy 'LeafCage/yankround.vim'
if neobundle#tap('yankround.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'mappings'     : ['<Plug>(yankround-'],
        \  }
        \})
  nmap p <Plug>(yankround-p)
  vmap p <Plug>(yankround-p)
  xmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  xmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
  function! neobundle#hooks.on_source(bundle)
    " 貼り付け文字列をハイライト
    let g:yankround_use_region_hl=1
    autocmd ColorScheme * highlight YankRoundRegion guibg=#302028
  endfunction
  call neobundle#untap()
endif "}}}


" vim-over : かっちょいい置換
NeoBundleLazy 'osyo-manga/vim-over'
if neobundle#tap('vim-over') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['OverCommandLine'],
        \  }
        \})
  " ssで置換開始
  vnoremap <silent>ss :OverCommandLine<CR>s///g<Left><Left><Left>
  nnoremap <silent>ss :OverCommandLine<CR>%s///g<Left><Left><Left>
  " swでカーソル以下の単語を置換
  nnoremap <silent>sS :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
  " virtualモード中は選択した文章で置き換え
  vnoremap <silent>sS y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
  function! neobundle#hooks.on_source(bundle)
    " <C-l> を <C-f> に
    " <C-h> を <C-b> に割り当てる
    let g:over_command_line_key_mappings = {
          \  "\<C-l>" : "\<C-f>",
          \  "\<C-h>" : "\<C-b>",
          \}
  endfunction
  call neobundle#untap()
endif "}}}

" }}}

" ColorSchema{{{{

"カラースキームのテスト
NeoBundleLazy 'cocopon/colorswatch.vim'
if neobundle#tap('colorswatch.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : ['ColorSwatchGenerate'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" color schema 256
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
" }}}

" Unite {{{{
" unite.vim : - すべてを破壊し、すべてを繋げ - vim scriptで実装されたanythingプラグイン
NeoBundleLazy 'Shougo/unite.vim'
if neobundle#tap('unite.vim') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'commands'     : [
        \      { 'name' : 'Unite', 'complete' : 'customlist,unite#complete_source' }, 
        \      'Unite', 'UniteWithCursorWord', 'UniteWithInput', 'UniteWithBufferDir'],
        \  }
        \})
  " The prefix key.
  nnoremap [unite]  <Nop>
  nmap     f        [unite]
  nnoremap [unite]u :<C-u>Unite -no-split<Space>
  " 全部乗せ
  nnoremap <silent>[unite]a  :<C-u>Unite -buffer-name=all buffer file_mru bookmark file grep:. find:.<CR><C-r><C-w><CR>*<C-r><C-w>*<CR>
  " バッファ一覧
  nnoremap <silent>[unite]b  :<C-u>Unite buffer -winheight=10<CR>
  " 最近使用したファイル一覧
  nnoremap <silent>[unite]h  :<C-u>Unite buffer file_mru -winheight=10<CR>
  " カレントディレクトリからファイル一覧
  nnoremap <silent>[unite]d  :<C-u>Unite -buffer-name=pwd_files file -winheight=15<CR>
  " カレントディレクトリからファイル一覧
  nnoremap <silent>[unite]D  :<C-u>Unite -buffer-name=git_files file_rec/async:! -winheight=15<CR>
  " 現在のバッファのカレントディレクトリからファイル一覧
  nnoremap <silent>[unite]c  :<C-u>UniteWithBufferDir -buffer-name=files file -winheight=15<CR>
  " レジスタ一覧
  nnoremap <silent>[unite]r  :<C-u>Unite register<CR>
  " グレップ検索
  nnoremap <silent>[unite]g  :<C-u>Unite grep:. -buffer-name=serch-buffer -no-quit<CR><C-r><C-w><CR>
  " グレップ検索
  nnoremap <silent>[unite]G  :<C-u>Unite grep  -no-quit<CR>
  " ファイル検索
  if g:is_windows
    nnoremap <silent>[unite]f  :<C-u>UniteWithCursorWord everything/async -no-quit<CR>
  else
    nnoremap <silent>[unite]f  :<C-u>Unite find:. -buffer-name=serch-file -no-quit<CR>*<C-r><C-w>*<CR>
  endif
  " すべてのソースを表示
  nnoremap <silent>[unite]s  :<C-u>Unite source<CR>
  " アウトラインを展開
  nnoremap <silent>[unite]t :<C-u>Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit<CR>
  nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit<CR>
  function! neobundle#hooks.on_source(bundle)
    " Start insert.
    let g:unite_enable_start_insert = 1
    let g:unite_source_file_mru_limit = 200
    let g:unite_source_grep_max_candidates = 2000
    if executable('ag')
      let g:unite_source_grep_command = 'ag'
      let g:unite_source_grep_default_opts = '-i --nogroup --nocolor --column --line-numbers'
      let g:unite_source_grep_recursive_opt = ''
    endif
    augroup setFiletypeUnite
      autocmd!
      autocmd FileType unite call s:unite_my_settings()
    augroup END
    function! s:unite_my_settings()
      " Overwrite settings.
      "
      " ESCキーを2回押すと終了する
      nmap     <buffer><ESC>      <Plug>(unite_exit)
      nmap     <buffer><ESC><ESC> <Plug>(unite_exit)
      imap     <buffer><C-q>      <Plug>(unite_exit)
      nmap     <buffer><C-q>      <Plug>(unite_exit)
      imap     <buffer>Q      <Plug>(unite_exit)
      nmap     <buffer>Q      <Plug>(unite_exit)
      "インサートモード終了
      imap     <buffer>jj         <Plug>(unite_insert_leave)
      imap     <buffer><C-w>      <Plug>(unite_delete_backward_path)
      "ノーマルモード中にCtrl + hjkl でウィンドウ移動
      nnoremap <buffer><C-h>              <C-w>h
      nnoremap <buffer><C-j>              <C-w>j
      nnoremap <buffer><C-k>              <C-w>k
      nnoremap <buffer><C-l>              <C-w>l
    endfunction
  endfunction
  call neobundle#untap()
endif "}}}

NeoBundleLazy 'Shougo/unite-outline' , { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('unite-outline') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'unite_sources' : ['outline'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

NeoBundleLazy 'tsukkee/unite-tag' , { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('unite-tag') "{{{
  call neobundle#config({
        \  'autoload' : {
        \    'unite_source' : ['tag'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

NeoBundle 'Shougo/neomru.vim'

" Uniteでeverythingの呼び出す
NeoBundleLazy 'sgur/unite-everything' , { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('unite-everything') "{{{
  call neobundle#config({
        \ 'disabled' : !g:is_windows, 
        \  'autoload' : {
        \    'unite_source' : ['everything'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
    "フルパスでソート
    let g:unite_source_everything_sort_by_full_path=1
    "サーチ対象はフルパス
    let g:unite_source_everything_full_path_search=1
    let g:unite_source_everything_limit=1000
    let g:unite_source_everything_ignore_pattern=""
  endfunction
  call neobundle#untap()
endif "}}}

"NeoBundle 'Shougo/unite-build'
"NeoBundle 'tsukkee/unite-help'
"NeoBundle 'basyura/unite-rails'
"NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'choplin/unite-vim_hacks'

" }}}

" gvim  {{{{
" Gvim上でフォントのサイズを変更する
NeoBundleLazy 'thinca/vim-fontzoom'
if neobundle#tap('vim-fontzoom') "{{{
  call neobundle#config({
        \  'gui' : 1 , 
        \  'autoload' : {
        \    'commands'     : ['Fontzoom']
        \  }
        \})
  " F11でフォントズーム
  nnoremap <F11> :Fontzoom +1<CR>
  " F12でフォント小さく
  nnoremap <F12> :Fontzoom -1<CR>
  function! neobundle#hooks.on_source(bundle)
    " デフォルトキーマップを使用しない
    let g:fontzoom_no_default_key_mappings=1
  endfunction
  call neobundle#untap()
endif "}}}

"vimをリスタート
NeoBundleLazy 'tyru/restart.vim'
if neobundle#tap('restart.vim') "{{{
  call neobundle#config({
        \  'gui' : 1,
        \  'autoload' : {
        \    'commands'     : ['Restart'],
        \  }
        \})
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif "}}}

" }}}

"レジスタを汚さない置換ペースト
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
map _  <Plug>(operator-replace)

call neobundle#end()

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" vim:set foldmethod=marker:
if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
