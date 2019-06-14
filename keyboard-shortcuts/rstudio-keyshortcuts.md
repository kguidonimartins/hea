Came from (and after some edits):

```r
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("CrossR")) devtools::install_github("jeffboichuk/CrossR")

sink("rstudio-keyshortcuts.md")
shortcuts %>%
  rename(linux = windows) %>%
  arrange(linux) %>%
  select(-mac) %>%
  mutate_all(str_to_lower) %>%
  select(linux, description, category) %>%
  mutate(
    linux = str_replace_all(linux, " ", ""),
    linux = paste0("`", linux, "`", ":")
    ) %>%
  as.data.frame() %>%
  split(.  category) %>%
  map(~.[ , c("linux", "description")])
sink()
```

# build
`ctrl+shift+b`     : build all
`ctrl+shift+d`     : roxygenize package
`ctrl+shift+e`     : check package
`ctrl+shift+k`     : compile pdf
`ctrl+shift+k`     : knit document
`ctrl+shift+k`     : preview html
`ctrl+shift+l`     : devtools load all
`ctrl+shift+t`     : test package

# console
`ctrl+l`           : console clear

# debug
`f10`              : debug step
`shift+f4`         : debug step into
`shift+f5`         : debug continue
`shift+f6`         : debug finish
`shift+f8`         : debug stop
`shift+f9`         : debug breakpoint

# execute
`alt+enter`        : execute code without moving cursor
`ctrl+alt+b`       : execute to current line
`ctrl+alt+e`       : execute from current line
`ctrl+alt+enter`   : send to terminal
`ctrl+alt+f`       : execute current function
`ctrl+alt+g`       : source a file
`ctrl+alt+n`       : execute next chunk
`ctrl+alt+p`       : execute previous chunks
`ctrl+alt+r`       : execute all code
`ctrl+alt+t`       : execute current section
`ctrl+enter`       : execute code
`ctrl+shift+enter` : execute current chunk
`ctrl+shift+enter` : source active document with echo
`ctrl+shift+p`     : execute last code
`ctrl+shift+s`     : source active file

# files
`ctrl+alt+s`       : save all source docs
`ctrl+o`           : open source doc
`ctrl+s`           : save source doc
`ctrl+shift+alt+w` : close other source docs
`ctrl+shift+f`     : find in files
`ctrl+shift+n`     : new r script
`ctrl+shift+w`     : close all source docs
`ctrl+w`           : close source doc

# other
`ctrl+``           : show request log
`ctrl+,`           : show options
`ctrl+alt+f11`     : previous plot
`ctrl+alt+f12`     : next plot
`ctrl+ctrl+f`      : toggle full screen
`ctrl+f8`          : synctex search
`ctrl+q`           : quit session
`ctrl+shift+``     : log focused element
`ctrl+shift+0`     : restart r
`ctrl+shift+f5`    : viewer save all and refresh
`ctrl+shift+f9`    : refresh super dev mode
`ctrl+shift+h`     : set working dir
`f7`               : check spelling
`shift+alt+k`      : help keyboard shortcuts
`shift+ctrl+,`     : project options

# panes
`ctrl+1`           : show source
`ctrl+2`           : show console
`ctrl+3`           : show help
`ctrl+4`           : show history
`ctrl+5`           : show files
`ctrl+6`           : show plots
`ctrl+7`           : show packages
`ctrl+8`           : show environment
`ctrl+9`           : show viewer
`ctrl+f1`          : show vcs
`ctrl+f2`          : show build
`ctrl+f5`          : show connections
`shift+alt+t`      : show terminal

# profile
`ctrl+shift+alt+p` : profile code

# source control
`ctrl+alt+d`       : diff files
`ctrl+alt+m`       : vcs commit

# source editor
`alt+-`            : insert assignment operator
`alt+l`            : collapse fold
`alt+o`            : collapse all folds
`ctrl+alt+i`       : insert chunk
`ctrl+alt+v`       : extract local variable
`ctrl+alt+x`       : extract function
`ctrl+i`           : reindent
`ctrl+k`           : yank line after cursor
`ctrl+shift+/`     : reflow comment
`ctrl+shift+a`     : reformat code
`ctrl+shift+alt+d` : show diagnostics project
`ctrl+shift+alt+m` : rename in scope
`ctrl+shift+alt+r` : insert roxygen skeleton
`ctrl+shift+c`     : comment uncomment
`ctrl+shift+m`     : insert pipe operator
`ctrl+shift+r`     : insert section
`ctrl+u`           : yank line up to cursor
`ctrl+w`           : kill region
`ctrl+y`           : insert yanked text
`shift+alt+l`      : expand fold
`shift+alt+o`      : expand all folds
`shift+tab`        : insert snippet

# source navigation
`ctrl+.`           : go to file function
`ctrl+alt+a`       : go to start of current scope
`ctrl+alt+a`       : split into lines
`ctrl+alt+down`    : add cursor below
`ctrl+alt+e`       : go to end of current scope
`ctrl+alt+u`       : find usages
`ctrl+alt+up`      : add cursor above
`ctrl+f`           : find replace
`ctrl+f10`         : source navigate forward
`ctrl+f3`          : find from selection
`ctrl+f9`          : source navigate back
`ctrl+p`           : jump to matching
`ctrl+pagedown`    : go to next section
`ctrl+pageup`      : go to prev section
`ctrl+shift+alt+e` : expand to matching
`ctrl+shift+down`  : shrink selection
`ctrl+shift+j`     : replace and find
`ctrl+shift+o`     : toggle document outline
`ctrl+shift+up`    : expand selection
`f3`               : find next
`shift+alt+g`      : go to line
`shift+alt+j`      : jump to
`shift+f3`         : find previous

# tabs
`ctrl+shift+.`     : switch to tab
`ctrl+shift+f11`   : first tab
`ctrl+shift+f12`   : last tab
`ctrl+shift+tab`   : previous tab
`ctrl+tab`         : next tab

# terminal
`ctrl+alt+f11`     : previous terminal
`ctrl+alt+f12`     : next terminal
`shift+alt+r`      : new terminal
