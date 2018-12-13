``` r
library(future)
library(furrr)
library(purrr)
library(parallel)

############################################################
#                                                          #
#                         parallel                         #
#                                                          #
############################################################

# how many cores?
(n_cores <- detectCores())
#> [1] 4
cl <- makeCluster(n_cores)

printar <- function(x) {
  print(x)
}

# clusterEvalQ(cl = cl,
#              {
#                # put below what you need inside each core
#                # library(pacote)
#                # printar <- function(x) {
#                #   print(x)
#                # }
#              }
# )

# how many cores?
# slice your data
df  <- 1:30
df1 <- df[1:10]
df2 <- df[11:20]
df3 <- df[21:30]

# send your data to each core
parallel::clusterExport(
  cl = cl,
  varlist = c(
    "df1",
    "df2",
    "df3",
    "printar"
  )
)

# run
system.time(
parallel::parLapply(
  cl = cl,
  X = c(
    df1,
    df2,
    df3
  ),
  fun = printar
)
)
#>    user  system elapsed
#>   0.000   0.004   0.083
# stop cluster!
stopCluster(cl)


############################################################
#                                                          #
#                          furrr                           #
#                                                          #
############################################################


# create your function
printar <- function(x){
  print(x)
}

# your data
df <- 1:30

# run
future::plan(multiprocess)
system.time(
furrr::future_map(.x = df, .f = printar, .progress = TRUE)
)
#> [1] 1
#> [1] 2
#> [1] 3
#> [1] 4
#> [1] 5
#> [1] 6
#> [1] 7
#> [1] 8
#> [1] 9
#> [1] 10
#> [1] 11
#> [1] 12
#> [1] 13
#> [1] 14
#> [1] 15
#> [1] 16
#> [1] 17
#> [1] 18
#> [1] 19
#> [1] 20
#> [1] 21
#> [1] 22
#> [1] 23
#> [1] 24
#> [1] 25
#> [1] 26
#> [1] 27
#> [1] 28
#> [1] 29
#> [1] 30
#>    user  system elapsed
#>   0.468   0.055   0.516

sessionInfo()
#> R version 3.4.4 (2018-03-15)
#> Platform: x86_64-pc-linux-gnu (64-bit)
#> Running under: Ubuntu 16.04.5 LTS
#>
#> Matrix products: default
#> BLAS: /usr/lib/libblas/libblas.so.3.6.0
#> LAPACK: /usr/lib/lapack/liblapack.so.3.6.0
#>
#> locale:
#>  [1] LC_CTYPE=pt_BR.UTF-8       LC_NUMERIC=C
#>  [3] LC_TIME=pt_BR.UTF-8        LC_COLLATE=en_US.UTF-8
#>  [5] LC_MONETARY=pt_BR.UTF-8    LC_MESSAGES=en_US.UTF-8
#>  [7] LC_PAPER=pt_BR.UTF-8       LC_NAME=C
#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C
#> [11] LC_MEASUREMENT=pt_BR.UTF-8 LC_IDENTIFICATION=C
#>
#> attached base packages:
#> [1] parallel  stats     graphics  grDevices utils     datasets  methods
#> [8] base
#>
#> other attached packages:
#> [1] purrr_0.2.5  furrr_0.1.0  future_1.9.0
#>
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_0.12.19     codetools_0.2-15 listenv_0.7.0    digest_0.6.17
#>  [5] rprojroot_1.3-2  backports_1.1.2  magrittr_1.5     evaluate_0.11
#>  [9] rlang_0.2.2      stringi_1.2.4    rmarkdown_1.10   tools_3.4.4
#> [13] stringr_1.3.1    yaml_2.2.0       compiler_3.4.4   globals_0.12.4
#> [17] htmltools_0.3.6  knitr_1.20
```

<sup>Created on 2018-10-13 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>
