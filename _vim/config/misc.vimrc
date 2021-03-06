"-------------------------------------------------------------------------------
" その他 Misc
"-------------------------------------------------------------------------------

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
" pluginとかでnmap :call hoge..とかやってるやつがあるので、
" :でもexコマンドに入れるようにしておく
" noremap : ;

"自作のシンタックス定義

augroup myFiletypes
  autocmd!
  autocmd BufNewFile,BufRead *.cmm setfiletype cmm
  autocmd BufNewFile,BufRead *.uni setfiletype uni
  autocmd BufNewFile,BufRead *.vfr setfiletype cpp
  autocmd BufNewFile,BufRead *.hfr setfiletype cpp
augroup END

"便利コマンド
"XMLファイルを整形する
command! FairingXml :%s/></>\r</g | filetype indent on | setf xml | normal gg=G

function! s:fairing_css() abort
  :%s/{/ {/g
  :%s/}/}/g
  :%s/;/;/g
endfunction
command! FairingCss : call s:fairing_css() | filetype indent on | setf css | normal gg=G

"markdownをPDFに変換(markdown-pdfコマンドが必要)
"npm install -g markdown-pdf
function! s:convert_pdf() abort
  let file_name = expand("%")
  let code = "markdown-pdf "
        \ ."-s " .g:markdown_css_filt_path ." "
        \ ."-f 'A4' " 
        \ . file_name
  let ret = system(code)
  echomsg code
endfunction
command! ConvertPdf :call s:convert_pdf()

"markdownをdocxに変換(pandocコマンドが必要)
" https://github.com/jgm/pandoc/releases
function! s:convert_docx() abort
  let file_name = expand("%")
  let docx_name = expand("%:r")
  let code = "pandoc "
        \ ."-f markdown_github "
        \ ."-t docx " 
        \ ."--reference-docx " .g:markdown_dox_filt_path ." "
        \ ."-o " . docx_name . ".docx "
        \ .file_name ." "
  let ret = system(code)
  echomsg code
endfunction
command! ConvertDocx :call s:convert_docx()
