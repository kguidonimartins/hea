# Identificar quebras de linhas em texto

Útil quando um parágrafo é copiado de um pdf ou de um site e, quando colado no editor, o texto apresenta algumas linhas quebradas.

```r
(\r\n)+|\r+|\n+|\t
```

[Adaptado](https://kaspars.net/blog/dev/regex-remove-all-line-breaks-from-text)
