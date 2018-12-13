```shell
apm install atom-ctags
```


### para tags \# em scripts do R
```shell
echo -e '\n\n--langdef=R\n--langmap=R:.R\n--regex-R=/^#+[ \t]*([^#]+)/\1/f,function/\n' >> /home/$USER/.atom/packages/atom-ctags/lib/.ctags
```

### para tags \# em arquivos .Rmd
```shell
echo -e '\n\n--langdef=RMarkdown\n--langmap=Markdown:+.Rmd\n--regex-RMarkdown=/^#+[ 	]*([^#]+)/\1/f,function/\n' >> /home/$USER/.atom/packages/atom-ctags/lib/.ctags
```
