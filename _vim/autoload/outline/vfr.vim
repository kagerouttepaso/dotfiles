"=============================================================================
" File    : autoload/unite/sources/outline/vfr.vim
" Author  : kitsunai <kitsunai@sanritz.co.jp>
" Updated : 2014-02-25
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================


" Default outline info for vfr
" Version: 0.0.5

function! outline#vfr#outline_info()
  return s:outline_info
endfunction

"-----------------------------------------------------------------------------
" Outline Info
let s:outline_info = {
      \ 'heading-1': '^\s*form\s*$', 
      \ 'heading'  : '^\s*form\s*formid',
      \ }

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let heading = {
        \ 'word' : a:heading_line,
        \ 'level': 0,
        \ 'type' : 'generic',
        \ }

  "if a:which ==# 'heading'
  "  let heading.level = strlen(matchstr(a:heading_line, '^\s*'))
  "  let heading.word = substitute(heading.word, '^\s*form\s*', '', '')
  "elseif a:which ==# 'heading-1'
  "  let heading.level = strlen(matchstr(a:matched_line, '^\s*'))
  "  let heading.word = substitute((heading.word, '^\s*', '', ''))
  "endif

  return heading
endfunction
