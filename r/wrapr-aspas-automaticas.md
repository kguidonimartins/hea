# Aspas automáticas

A função `qc` do pacote `wrapr` insere aspas automáticas em palavras, por exemplo:

```r
if (!require("wrapr")) install.packages("wrapr")
# aspas automáticas nas seguintes palavras
qc(gato, cachorro, rato)
```

Essa função é útil para selecionar colunas em um *dataframe*, por exemplo:

```r
# nomes das colunas com aspas
head(mtcars[, c("mpg", "cyl", "wt")])
# nomes das colunas sem aspas
head(mtcars[, qc(mpg, cyl, wt)])
```

[Fonte](http://www.win-vector.com/blog/2018/02/r-tip-use-qc-for-fast-legible-quoting/)
