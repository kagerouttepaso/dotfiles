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
