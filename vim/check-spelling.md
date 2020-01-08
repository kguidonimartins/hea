" Setting spellchecker -------------------------------------------------------
" Adaptado de:
" http://brito.blog.incolume.com.br/2011/12/vim-com-corretor-ortografico-em.html
" ```bash
" mkdir -p /tmp/vim_spell/pt_BR
" cd /tmp/vim_spell/
" wget
" https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBRV320AOC.oxt 
" unzip -x VeroptBRV320AOC.oxt -d pt_BR/
" cd pt_BR
" vim
" :mkspell pt pt_BR
" :q
" mkdir -p ~/.vim/spell/
" cp pt.utf-8.spl ~/.vim/spell
"
" cd ..
" mkdir -p en_US
" wget
" https://extensions.libreoffice.org/extensions/english-dictionaries/2019-03.01/@@download/file/dict-en-20190301.oxt
" unzip -x dict-en-20190301.oxt -d en_US
" cd en_US
" vim
" :mkspell en en_US
" :q
" cp en.utf-8.spl ~/.vim/spell
"
" cd ..
" mkdir -p es_ES 
" wget
" https://extensions.libreoffice.org/extensions/diccionario-espanol/1.0/@@download/file/spanish-dictionary.oxt
" unzip -x spanish-dictionary.oxt -d es_ES
" cd es_ES
" vim
" :mkspell es es_ANY
" :q
" cp es.utf-8.spl ~/.vim/spell
" ```

" set spell

" set spell spelllang=pt
"
" function! ToggleSpell()
"   if &spell
"     if &spelllang == "pt"
"       set spelllang=pt,es,en
"       echo "toggle spell" &spelllang
"     elseif &spelllang == "pt,es,en"
"       set spelllang=en
"       echo "toggle spell" &spelllang
"     elseif &spelllang == "en"
"       set spelllang=es
"       echo "toggle spell" &spelllang
"     else
"       set spell!
"       echo "toggle spell off"
"     endif
"   else
"     set spelllang=pt
"     set spell!
"     echo "toggle spell" &spelllang
"   endif
" endfunction
"
" map <F2> :call ToggleSpell()<CR>
