```r
alvo <- "aaa"

gsub(
  pattern = "(^[[:alpha:]])", 
  replacement = "\\U\\1", 
  x = alvo, 
  perl = TRUE
  )
#> [1] "Aaa"
```


