"   You will have to restart vim for this to take effect.  In any case
"   it is a good idea to read ":he new-filetype" so that you know what
"   is going on, and why the above lines work.
"
"   Written originally by Dominic Mitchell, Jan 2006.
"   happygiraffe.net
"
"   Modified by Aaron Bieber, May 2007.
"   blog.aaronbieber.com
"
"   Modified by Tim Harper, July 2008 - current
"   tim.theenchanter.com
" @(#) $Id$

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" " uni commands like "h1" are case sensitive, AFAIK.
" syn case match
" 
" " uni syntax: <http://textism.com/tools/uni/>
" 
" " Inline elements.
" syn match uniEmphasis    /_[^_]\+_/
" syn match uniBold        /\*[^*]\+\*/
" syn match uniCite        /??.\+??/
" syn match uniDeleted     /-[^-]\+-/
" syn match uniInserted    /+[^+]\++/
" syn match uniSuper       /\^[^^]\+\^/
" syn match uniSub         /\~[^~]\+\~/
" syn match uniSpan        /%[^%]\+%/
" syn match uniFootnoteRef /\[[0-9]\+]/
" syn match uniCode        /@[^@]\+@/
" 
" " Block elements.
" syn match uniHeader      /^h1\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. .\+/
" syn match uniHeader2     /^h2\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. .\+/
" syn match uniHeader3     /^h[3-6]\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\..\+/
" syn match uniFootnoteDef /^fn[0-9]\+\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\./
" syn match uniListBullet  /\v^\*+ /
" syn match uniListBullet2  /\v^(\*\*)+ /
" syn match uniListNumber  /\v^#+ /
" syn match uniListNumber2  /\v^(##)+ /
" 
" syn region uniCodeblock start="^bc\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"
" syn region uniCodeblock start="<pre>" end="<\/pre>"
" syn region uniBlockquote start="^bq\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"
" syn region uniParagraph start="^bq\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"
" 
" syn cluster uniBlockElement contains=uniHeader,uniBlockElement,uniFootnoteDef,uniListBullet,uniListNumber
" 
" syn match  uniElements /[^| ]*/ contained
" syn region  uniTable start=/|/ end=/|$/  contains=uniElements
" 
" 
" " Everything after the first colon is from RFC 2396, with extra
" " backslashes to keep vim happy...  Original:
" " ^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?
" "
" " Revised the pattern to exclude spaces from the URL portion of the
" " pattern. Aaron Bieber, 2007.
" syn match uniLink /"[^"]\+":\(\([^:\/?# ]\+\):\)\?\(\/\/\([^\/?# ]*\)\)\?\([^?# ]*\)\(?\([^# ]*\)\)\?\(#\([^ ]*\)\)\?/
" 
" syn cluster uniInlineElement contains=uniEmphasis,uniBold,uniCite,uniDeleted,uniInserted,uniSuper,uniSub,uniSpan

syn match uniComment /^[ ]*\/\/.*$/
syn keyword uniTest test

if version >= 508 || !exists("did_uni_syn_inits")
    if version < 508
        let did_uni_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

     Hilink uniComment Comment
     Hilink uniTest Comment
"    HiLink uniElements Constant
"    HiLink uniTable Statement
"    HiLink uniHeader Title
"    HiLink uniHeader2 Question
"    HiLink uniHeader3 Statement
"    HiLink uniBlockquote Comment
"    HiLink uniCodeblock Identifier
"    HiLink uniListBullet Operator
"    HiLink uniListBullet2 Constant
"    HiLink uniListNumber Operator
"    HiLink uniListNumber2 Constant
"    HiLink uniLink String
"    HiLink uniCode Identifier
"    hi def uniEmphasis term=underline cterm=underline gui=italic
"    hi def uniBold term=bold cterm=bold gui=bold

    delcommand HiLink
endif

" vim: set ai et sw=4 :
