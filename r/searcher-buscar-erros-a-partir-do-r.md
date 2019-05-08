# Fazendo buscas por erros a partir do R

## Instale

```r
devtools::install_github("coatless/searcher")
library(searcher)
```

## Pesquisa básica

```r
searcher::search_google("remove ggplot2 legend")
```

## Buscar pelo último erro ocorrido!

```r
plot("a")

search_google()
```
