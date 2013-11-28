" Vim syntax file
" Language:	CMM
" Maintainer:	kitsunai
" Last Change:	2013-11-28


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'cmm'
endif

" based on "JavaScript" VIM syntax by Claudio Fleiner <claudio@fleiner.com>

"syn case ignore
"syn match   actionScriptLineComment			"\/\/.*$"
"syn match   actionScriptCommentSkip			"^[ \t]*\*\($\|[ \t]\+\)"
"syn region  actionScriptCommentString			start=+"+  skip=+\\\\\|\\"+  end=+"+ end=+\*/+me=s-1,he=s-1 contains=actionScriptSpecial,actionScriptCommentSkip,@htmlPreproc
"syn region  actionScriptComment2String			start=+"+  skip=+\\\\\|\\"+  end=+$\|"+  contains=actionScriptSpecial,@htmlPreproc
"syn region  actionScriptComment				start="/\*"  end="\*/" contains=actionScriptCommentString,actionScriptCharacter,actionScriptNumber
"syn match   actionScriptSpecial				"\\\d\d\d\|\\."
"syn region  actionScriptStringD				start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=actionScriptSpecial,@htmlPreproc
"syn region  actionScriptStringS				start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=actionScriptSpecial,@htmlPreproc
"syn match   actionScriptSpecialCharacter		"'\\.'"
"syn match   actionScriptNumber				"-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
"syn keyword actionScriptConditional			if else and or not
syn match cmmComment    "^[ ]*;.*$"



if main_syntax == "cmm"
  syn sync ccomment cmmComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cmm_syn_inits")
  if version < 508
    let did_cmm_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cmmComment  Comment
  delcommand HiLink
endif

let b:current_syntax = "cmm"
if main_syntax == 'cmm'
  unlet main_syntax
endif

" vim: ts=8
