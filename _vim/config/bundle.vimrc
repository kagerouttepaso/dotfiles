if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=$DOTVIM_DIR/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc : vimから非同期実行
if has("win64") || has("win32")
else
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
endif

" Completion {{{

" 補完 neocomplcache.vim : 究極のVim的補完環境
" 補完 neocomplete.vim : 究極のVim的補完環境
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
  NeoBundle      'Shougo/neocomplete.vim'
  NeoBundleFetch 'Shougo/neocomplcache.vim'
else
  NeoBundleFetch 'Shougo/neocomplete.vim'
  NeoBundle      'Shougo/neocomplcache.vim'
endif

" neocomplcacheのsinpet補完
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" ユーザー定義スニペット保存ディレクトリ
let g:neosnippet#snippets_directory=expand($DOTVIM_DIR.'/snippets')
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

" 改造したmonday.vim Ctrl+a or Ctrl+x の大幅な拡張
NeoBundle 'kagerouttepaso/monday'

" rubyでrequire先を補完する
" NeoBundle 'ujihisa/neco-ruby'

" A neocomplcache plugin for English, using look command
" NeoBundle 'ujihisa/neco-look'
" }}}

" Searching/Moving{{{
" smooth_scroll.vim : スクロールを賢く
"NeoBundle 'Smooth-Scroll'

" vim-smartword : 単語移動がスマートな感じで
"NeoBundle 'smartword'

" camelcasemotion : CamelCaseやsnake_case単位でのワード移動
"NeoBundle 'camelcasemotion'

" <Leader><Leader>w/fなどで、motion先をhilightする
"NeoBundle 'EasyMotion'

" matchit.vim : 「%」による対応括弧へのカーソル移動機能を拡張
"NeoBundle 'matchit.zip'

" ruby用のmatchit拡張
"NeoBundle 'ruby-matchit'

" grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
NeoBundle 'grep.vim'

" eregex.vim : vimの正規表現をrubyやperlの正規表現な入力でできる :%S/perlregex/
"NeoBundle 'eregex.vim'

" open-browser.vim : カーソルの下のURLを開くor単語を検索エンジンで検索
NeoBundle 'tyru/open-browser.vim'

" }}}

" Programming {{{
" quickrun.vim : 編集中のファイルを簡単に実行できるプラグイン
NeoBundle 'thinca/vim-quickrun'

" perldocやphpmanual等のリファレンスをvim上で見る
"NeoBundle 'thinca/vim-ref'

" SQLUtilities : SQL整形、生成ユーティリティ
"NeoBundle 'SQLUtilities'

" vim-ruby : VimでRubyを扱う際の最も基本的な拡張機能
NeoBundle 'vim-ruby/vim-ruby'

" rails.vim : rails的なアレ
"NeoBundle 'tpope/vim-rails'

" Pydiction : Python用の入力補完
"NeoBundle 'Pydiction'

" ソースコード上のメソッド宣言、変数宣言の一覧を表示
NeoBundle 'taglist.vim'
" 関数一覧
"set tags=tags
"set tags+=~/.tags
"let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags' " ctagsのパス
let Tlist_Show_One_File      = 1     " 現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow    = 1     " taglistのウィンドーが最後のウィンドーならばVimを閉じる
"let Tlist_Use_Right_Window = 1      " 右側でtaglistのウィンドーを表示h
let Tlist_Enable_Fold_Column = 1     " 折りたたみ
"let Tlist_Auto_Open = 1             " 自動表示
let Tlist_Auto_Update        = 1
let Tlist_WinWidth           = 30
map <silent><leader>tl       :Tlist<CR>        " taglistを開くショットカットキー
"nmap <F7> :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>
"nmap <Leader>tl :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>

" エラーがある場所をhilight
"NeoBundle 'errormarker.vim'

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
" DumbBuf.vim : quickbufっぽくbufferを管理。 "<Leader>b<Space>でBufferList
"NeoBundle 'DumbBuf'

"  Kwbd.vim : レイアウトを崩さずにバッファを削除
NeoBundle 'rgarver/Kwbd.vim'
"CBでウィンドウの形を変えずにバッファを閉じる
command! QB :Kwbd
function! QuitBuffer()
  :Kwbd
  :quit
endfunction
command! QQ :call QuitBuffer()

" }}}

" Encording {{{
NeoBundle 'banyan/recognize_charcode.vim'
" }}}

" Utility {{{

" vimshell : vimのshell
NeoBundle 'Shougo/vimshell'
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

" vimfiler : vimのファイラ
NeoBundle 'Shougo/vimfiler'


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
NeoBundle 'gregsexton/gitv'
" 呼び出しコマンド
command! Tig :Gitv --all
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

" ステータスラインをカッコよくする
" NeoBundle 'Lokaltog/vim-powerline'

" Redmine on Vim
"NeoBundle 'mattn/vim-metarw-redmine'

" A framework to read/write fake:path
"NeoBundle 'kana/vim-metarw'

" https://github.com/airblade/vim-gitgutter
NeoBundle 'sgur/vim-gitgutter'

" Doxygenのサポーターらしい
NeoBundle 'DoxygenToolkit.vim'

" Doxygenのサポーターらしい
"NeoBundle 'doxygen-support.vim'

"テンプレートファイルを作成する
NeoBundle 'kagerouttepaso/sonictemplate-vim'

" yankround : 副作用のないYankRing
NeoBundle 'LeafCage/yankround.vim'
" 貼り付け文字列をハイライト
let g:yankround_use_region_hl=1
nmap p <Plug>(yankround-p)
vmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
autocmd ColorScheme * highlight YankRoundRegion guibg=#302028

" vim-over : かっちょいい置換
NeoBundle 'osyo-manga/vim-over'
" ssで置換開始
vnoremap <silent>ss :OverCommandLine<CR>s///g<Left><Left><Left>
nnoremap <silent>ss :OverCommandLine<CR>%s///g<Left><Left><Left>
" swでカーソル以下の単語を置換
nnoremap <silent>sS :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" virtualモード中は選択した文章で置き換え
vnoremap <silent>sS y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" <C-l> を <C-f> に
" <C-h> を <C-b> に割り当てる
let g:over_command_line_key_mappings = {
      \  "\<C-l>" : "\<C-f>",
      \  "\<C-h>" : "\<C-b>",
      \}
" }}}

" ColorSchema{{{{
" color schema 256
"NeoBundle 'desert256.vim'
"NeoBundle 'mrkn256.vim'
"NeoBundle 'tomasr/molokai'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
" }}}

" Unite {{{{
" unite.vim : - すべてを破壊し、すべてを繋げ - vim scriptで実装されたanythingプラグイン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-build'
"NeoBundle 'tsukkee/unite-help'
NeoBundle 'Shougo/unite-outline'
"NeoBundle 'basyura/unite-rails'
"NeoBundle 'thinca/vim-unite-history'
NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'choplin/unite-vim_hacks'
NeoBundle 'Shougo/neomru.vim'
" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 200
let g:unite_source_grep_max_candidates = 2000
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
if has("win32") || has("win64")
  nnoremap <silent>[unite]f  :<C-u>UniteWithCursorWord everything/async -no-quit<CR>
else
  nnoremap <silent>[unite]f  :<C-u>Unite find:. -buffer-name=serch-file -no-quit<CR>*<C-r><C-w>*<CR>
endif
" すべてのソースを表示
nnoremap <silent>[unite]s  :<C-u>Unite source<CR>
" アウトラインを展開
nnoremap <silent>[unite]t :<C-u>Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit<CR>
nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -winwidth=50 -buffer-name=outline -no-focus -no-start-insert -no-quit<CR>


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
" }}}

" gvim  {{{{
" Gvim上でフォントのサイズを変更する
NeoBundle 'thinca/vim-fontzoom'
" デフォルトキーマップを使用しない
let g:fontzoom_no_default_key_mappings=1
" F11でフォントズーム
nnoremap <F11> :Fontzoom +1<CR>
" F12でフォント小さく
nnoremap <F12> :Fontzoom -1<CR>
" }}}

" windows {{{{
if has("win32") || has("win64")
  " Uniteでeverythingの呼び出す
  NeoBundle 'sgur/unite-everything'
  "フルパスでソート
  let g:unite_source_everything_sort_by_full_path=1
  "サーチ対象はフルパス
  let g:unite_source_everything_full_path_search=1
  let g:unite_source_everything_limit=1000
  let g:unite_source_everything_ignore_pattern=""
endif
" }}}

"test {{{{

"tagsの非同期読み込み
"NeoBundle 'alpaca-tc/alpaca_tags'

"ソースのレイアウト修正に便利なやつ
NeoBundle 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
vmap <Leader><Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
nmap <Leader><Leader>a <Plug>(LiveEasyAlign)
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

"VIMSHELとかのカラー編集
NeoBundle 'itchyny/landscape.vim'
let g:landscape_highlight_url        = 1
let g:landscape_highlight_todo       = 1
let g:landscape_highlight_full_space = 0
"let g:unite_cursor_line_highlight    = 'CursorLine'

"かっこいいステータスライン
"NeoBundle 'itchyny/lightline.vim'

"vimをリスタート
NeoBundle 'tyru/restart.vim'

"fyletypeの自動切り替え
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'
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

"単語を色付けすることができる
NeoBundle 't9md/vim-quickhl'
nmap gm <Plug>(quickhl-manual-this)
xmap gm <Plug>(quickhl-manual-this)
nmap gM <Plug>(quickhl-manual-reset)
xmap gM <Plug>(quickhl-manual-reset)
nmap gj <Plug>(quickhl-cword-toggle)

"レジスタを汚さない置換ペースト
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
map _  <Plug>(operator-replace)


"カラースキームのテスト
NeoBundle 'cocopon/colorswatch.vim'
"}}}


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
