# Rodando jobs via `{rstudioapi}`

Uma das funções mais úteis implementadas na versão 1.2 do RStudio é a `Jobs`. Ela permite rodar funções e/ou scripts inteiros em *background*, deixando o console livre para continuarmos o trabalho. Um dos problemas é ter que clicar na aba `Jobs`, escolher o script que desejamos e iniciar o processo. Por que não rodar isso direto no script que estamos trabalhando?


## Criando a função para jobs a partir do script

```r
`%<j%` <- function(x, y) {
  var_name <- paste0(deparse(substitute(x)))
  expr <- paste0(deparse(substitute(y)), collapse = "\n")

  script <- tempfile()
  lines <- writeLines(paste0(var_name, " <- ", expr), script)

  rstudioapi::jobRunScript(script,
                           name = paste0("computing ", var_name),
                           workingDir = getwd(),
                           importEnv = TRUE,
                           exportEnv = "R_GlobalEnv")
}
```

## Criando uma função comum para rodar o job

```r
long_run <- function(x){
  vec <- c()
  for (i in seq_along(x)) {
    Sys.sleep(1)
    vec[i] <- i
  }
  return(vec)
}
```

## Testando

Vale a pena lembrar que isso funciona a partir da versão 1.2 do RStudio e, obviamente, só funciona usando o RStudio.

```r
my_results %<j% long_run(1:3)
# confira o resultado do job
my_results
```

## `Jobs` usando `source()`

É possível rodar um script externo usando a função `%<j%`.

```r
my_results_from_external_script %<j% source("long-run_jobs.R")
```

Fonte:

- Tweet: https://twitter.com/d_olivaw/status/1129460176036216834
- Gist: https://gist.github.com/eliocamp/747ca3f3499368858232045add08d927
