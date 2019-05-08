# Lendo e concatenando vários arquivos

Instale os pacotes necessários

```r
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("fs")) install.packages("fs")
if (!require("here")) install.packages("here")
```

Para concatenar linhas, use:

```r
data <- 
  here::here() %>%
  dir_ls(regexp = "\\.csv$") %>% 
  map_dfr(read_csv, .id = "source")
```

Para concatenar colunas, use:

```r
data <- 
  here::here() %>%
  dir_ls(regexp = "\\.csv$") %>% 
  map_dfc(read_csv)
```

Fontes: 

1. https://mobile.twitter.com/W_R_Chase/status/1104588157792731138

2. https://stackoverflow.com/a/51937327 

