"-------------------------------------------------------------------------------
" その他 Misc
"-------------------------------------------------------------------------------

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
" pluginとかでnmap :call hoge..とかやってるやつがあるので、
" :でもexコマンドに入れるようにしておく
" noremap : ;

"自作のシンタックス定義
au BufNewFile,BufRead *.cmm setfiletype cmm
au BufNewFile,BufRead *.uni setfiletype uni
