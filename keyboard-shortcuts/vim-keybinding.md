Vim Keybinding
==============

NAVIGATION
----------

`0`              : go to the starting of the current line.
`^`              : go to the first non blank character of the line.
`$`              : go to the end of the current line.
`g_`             : go to the last non blank character of the line.
`H`              : go to the first line of current screen.
`M`              : go to the middle line of current screen.
`L`              : go to the last line of current screen.
`ctrl-f`         : jump forward one full screen.
`ctrl-b`         : jump backwards one full screen
`ctrl-d`         : jump forward (down) a half screen
`ctrl-u`         : jump back (up) one half screen
`ctrl-e`         : line-wise scrolling
`ctrl-y`         : line-wise scrolling

NORMAL MODE
-----------

`*`              : go to the next match terms
`ctrl-n`         : autocomplete
`vi"`            : visually select all inside the doublequotes
`va(`            : visually select all inside the bracket, including bracket
`I`              : go to the begin of the line and insert
`A`              : go to the end of the line and insert
`J`              : remove breaklines
`gwip`           : add breakline in a continuous paragraph
`.`              : dotcommand - repeat the last move
`:set hlsearch`  : highlight words in search
`:set nohlsearch`: disable with
`o`              : to start inserting on a new line below the current one
`O`              : to start inserting on a new line above the current one
`u`              : undo
`ctrl-r`         : redo
`dto`            : delete up to character 'o'
`fa`             : move forward to the character 'a'
`cw`             : change word
`ctA`            : change up to the character 'A'
`ct(`            : change up to the character '('
`cc`             : change the entire line
`ciw`            : change inside word
`ci(`            : change in parenthesis
`ci{`            : change in curly brace
`ci<`            : change in < > angle brackets
`ci"`            : change inside quotes (this leaves the quotes intact)
`ca"`            : change (a)round quotes … means quotes get replaced too
`cat`            : change (a)round (t)ag … yep, vim understands html tags! 

VISUAL MODE
-----------

`vwU`              : change the selected word to uppercase
`vwu`              : change the selected word to lowercase
`gU<motion>`       : change based on motion; gU$ = uppercase from here to the final of line
`ctrl-v`           : visual block; select columns 
`ctrl-v`+`shift-i` : edit with multiple cursor 
`gg + shift-v`+`shift-g + :sort u` : select multiple lines, sort and remove duplicated lines 

SPELL CHECKER
-------------

`]s` : vai para a próxima palavra
`[s` : vai para a palavra anterior
`z=` : mostra a lista de sugestões para a palavra
`zg` : adiciona a palavra sob o cursor no dicionário, assim ela não será mais marcada como errada
`zug`: desfaz a última palavra adicionada
`zw` : remove a palavra sob o cursor do dicionário,   assim ela será marcada como errada
`zuw`: desfaz a última palavra removida

MAP
---

`:map ,l :!Rscript %<cr>`: map `,l` command in normal mode to source a R script inside vim

REFS
----

- https://raw.githubusercontent.com/rtorr/vim-cheat-sheet/master/lang/pt_br/index.html

- https://www.thegeekstuff.com/2009/03/8-essential-vim-editor-navigation-fundamentals/

- http://vimdoc.sourceforge.net/htmldoc/help.html
