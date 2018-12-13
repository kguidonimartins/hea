# "gather and spread by data carpentry"

### get data

``` r
library(tidyverse)
surveys <- read.csv("https://ndownloader.figshare.com/files/2292169")
glimpse(surveys)
#> Observations: 34,786
#> Variables: 13
#> $ record_id       <int> 1, 72, 224, 266, 349, 363, 435, 506, 588, 661,...
#> $ month           <int> 7, 8, 9, 10, 11, 11, 12, 1, 2, 3, 4, 5, 6, 8, ...
#> $ day             <int> 16, 19, 13, 16, 12, 12, 10, 8, 18, 11, 8, 6, 9...
#> $ year            <int> 1977, 1977, 1977, 1977, 1977, 1977, 1977, 1978...
#> $ plot_id         <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2...
#> $ species_id      <fct> NL, NL, NL, NL, NL, NL, NL, NL, NL, NL, NL, NL...
#> $ sex             <fct> M, M, , , , , , , M, , , M, M, M, M, , M, M, M...
#> $ hindfoot_length <int> 32, 31, NA, NA, NA, NA, NA, NA, NA, NA, NA, 32...
#> $ weight          <int> NA, NA, NA, NA, NA, NA, NA, NA, 218, NA, NA, 2...
#> $ genus           <fct> Neotoma, Neotoma, Neotoma, Neotoma, Neotoma, N...
#> $ species         <fct> albigula, albigula, albigula, albigula, albigu...
#> $ taxa            <fct> Rodent, Rodent, Rodent, Rodent, Rodent, Rodent...
#> $ plot_type       <fct> Control, Control, Control, Control, Control, C...
```

## `spread()`

### How `spread()` works\!

![](https://datacarpentry.org/R-ecology-lesson/img/spread_data_R.png)

#### Make a “long-format” data frame

``` r
surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>%
  summarize(mean_weight = mean(weight))

surveys_gw
#> # A tibble: 196 x 3
#> # Groups:   genus [?]
#>    genus       plot_id mean_weight
#>    <fct>         <int>       <dbl>
#>  1 Baiomys           1        7
#>  2 Baiomys           2        6
#>  3 Baiomys           3        8.61
#>  4 Baiomys           5        7.75
#>  5 Baiomys          18        9.5
#>  6 Baiomys          19        9.53
#>  7 Baiomys          20        6
#>  8 Baiomys          21        6.67
#>  9 Chaetodipus       1       22.2
#> 10 Chaetodipus       2       25.1
#> # ... with 186 more rows
```

``` r
surveys_spread <- surveys_gw %>%
  spread(
    key = genus,         # quem vai virar coluna
    value = mean_weight  # quem vai preencher as células
  )

surveys_spread
#> # A tibble: 24 x 11
#>    plot_id Baiomys Chaetodipus Dipodomys Neotoma Onychomys Perognathus
#>      <int>   <dbl>       <dbl>     <dbl>   <dbl>     <dbl>       <dbl>
#>  1       1    7           22.2      60.2    156.      27.7        9.62
#>  2       2    6           25.1      55.7    169.      26.9        6.95
#>  3       3    8.61        24.6      52.0    158.      26.0        7.51
#>  4       4   NA           23.0      57.5    164.      28.1        7.82
#>  5       5    7.75        18.0      51.1    190.      27.0        8.66
#>  6       6   NA           24.9      58.6    180.      25.9        7.81
#>  7       7   NA           19.9      57.4    170.      23.6        7
#>  8       8   NA           20.5      59.4    134.      25.9        7.06
#>  9       9   NA           18.9      57.5    162.      27.5        7.37
#> 10      10   NA           22.3      51.8    190       28.7       NA
#> # ... with 14 more rows, and 4 more variables: Peromyscus <dbl>,
#> #   Reithrodontomys <dbl>, Sigmodon <dbl>, Spermophilus <dbl>
```

### How `gather()` works\!

![](https://datacarpentry.org/R-ecology-lesson/img/gather_data_R.png)

#### Use the “wide-format” data frame

``` r
surveys_gather <- surveys_spread %>%
  gather(
    key = genus,          # nome para a coluna de colunas
    value = mean_weight,  # nome para a coluna de células
    -plot_id              # menos o plot_id
  )

surveys_gather
#> # A tibble: 240 x 3
#>    plot_id genus   mean_weight
#>      <int> <chr>         <dbl>
#>  1       1 Baiomys        7
#>  2       2 Baiomys        6
#>  3       3 Baiomys        8.61
#>  4       4 Baiomys       NA
#>  5       5 Baiomys        7.75
#>  6       6 Baiomys       NA
#>  7       7 Baiomys       NA
#>  8       8 Baiomys       NA
#>  9       9 Baiomys       NA
#> 10      10 Baiomys       NA
#> # ... with 230 more rows
```

#### Selecione as colunas que você quer transformar em “long-format”

#### Assim - escolhendo as colunas:

``` r
surveys_spread %>%
  gather(
    key = genus,
    value = mean_weight,
    c(Baiomys, Reithrodontomys)
  )
#> # A tibble: 48 x 11
#>    plot_id Chaetodipus Dipodomys Neotoma Onychomys Perognathus Peromyscus
#>      <int>       <dbl>     <dbl>   <dbl>     <dbl>       <dbl>      <dbl>
#>  1       1        22.2      60.2    156.      27.7        9.62       22.2
#>  2       2        25.1      55.7    169.      26.9        6.95       22.3
#>  3       3        24.6      52.0    158.      26.0        7.51       21.4
#>  4       4        23.0      57.5    164.      28.1        7.82       22.6
#>  5       5        18.0      51.1    190.      27.0        8.66       21.2
#>  6       6        24.9      58.6    180.      25.9        7.81       21.8
#>  7       7        19.9      57.4    170.      23.6        7          22.2
#>  8       8        20.5      59.4    134.      25.9        7.06       20.1
#>  9       9        18.9      57.5    162.      27.5        7.37       21.7
#> 10      10        22.3      51.8    190       28.7       NA          21.1
#> # ... with 38 more rows, and 4 more variables: Sigmodon <dbl>,
#> #   Spermophilus <dbl>, genus <chr>, mean_weight <dbl>
```

#### Ou assim - em sequência:

``` r
surveys_spread %>%
  gather(
    key = genus,
    value = mean_weight,
    Baiomys:Reithrodontomys
  )
#> # A tibble: 192 x 5
#>    plot_id Sigmodon Spermophilus genus   mean_weight
#>      <int>    <dbl>        <dbl> <chr>         <dbl>
#>  1       1     NA             NA Baiomys        7
#>  2       2     70.9           NA Baiomys        6
#>  3       3     65.6           NA Baiomys        8.61
#>  4       4     82             NA Baiomys       NA
#>  5       5     82.7           NA Baiomys        7.75
#>  6       6     68.8           NA Baiomys       NA
#>  7       7     NA             NA Baiomys       NA
#>  8       8     NA             NA Baiomys       NA
#>  9       9     56.5           NA Baiomys       NA
#> 10      10    101             NA Baiomys       NA
#> # ... with 182 more rows
```

[Fonte](https://datacarpentry.org/R-ecology-lesson/03-dplyr.html#reshaping_with_gather_and_spread)

<sup>Created on 2018-12-12 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>

<details>

<summary>Session info</summary>

``` r
devtools::session_info()
#> ─ Session info ──────────────────────────────────────────────────────────
#>  setting  value
#>  version  R version 3.4.4 (2018-03-15)
#>  os       Ubuntu 16.04.5 LTS
#>  system   x86_64, linux-gnu
#>  ui       X11
#>  language en_US
#>  collate  en_US.UTF-8
#>  ctype    pt_BR.UTF-8
#>  tz       America/Sao_Paulo
#>  date     2018-12-12
#>
#> ─ Packages ──────────────────────────────────────────────────────────────
#>  package     * version    date       lib source
#>  assertthat    0.2.0      2017-04-11 [1] CRAN (R 3.4.4)
#>  backports     1.1.2      2017-12-13 [1] CRAN (R 3.4.4)
#>  base64enc     0.1-3      2015-07-28 [1] CRAN (R 3.4.4)
#>  bindr         0.1.1      2018-03-13 [1] CRAN (R 3.4.4)
#>  bindrcpp    * 0.2.2      2018-03-29 [1] CRAN (R 3.4.4)
#>  broom         0.5.0      2018-07-17 [1] CRAN (R 3.4.4)
#>  callr         3.0.0      2018-08-24 [1] CRAN (R 3.4.4)
#>  cellranger    1.1.0      2016-07-27 [1] CRAN (R 3.4.4)
#>  cli           1.0.1      2018-09-25 [1] CRAN (R 3.4.4)
#>  colorspace    1.3-2      2016-12-14 [1] CRAN (R 3.4.4)
#>  crayon        1.3.4      2017-09-16 [1] CRAN (R 3.4.4)
#>  desc          1.2.0      2018-05-01 [1] CRAN (R 3.4.4)
#>  devtools      2.0.1      2018-10-26 [1] CRAN (R 3.4.4)
#>  digest        0.6.18     2018-10-10 [1] CRAN (R 3.4.4)
#>  dplyr       * 0.7.8      2018-11-10 [1] CRAN (R 3.4.4)
#>  evaluate      0.12       2018-10-09 [1] CRAN (R 3.4.4)
#>  fansi         0.4.0      2018-10-05 [1] CRAN (R 3.4.4)
#>  forcats     * 0.3.0      2018-02-19 [1] CRAN (R 3.4.4)
#>  fs            1.2.6      2018-08-23 [1] CRAN (R 3.4.4)
#>  ggplot2     * 3.1.0      2018-10-25 [1] CRAN (R 3.4.4)
#>  glue          1.3.0      2018-07-17 [1] CRAN (R 3.4.4)
#>  gtable        0.2.0      2016-02-26 [1] CRAN (R 3.4.4)
#>  haven         2.0.0      2018-11-22 [1] CRAN (R 3.4.4)
#>  hms           0.4.2      2018-03-10 [1] CRAN (R 3.4.4)
#>  htmltools     0.3.6      2017-04-28 [1] CRAN (R 3.4.4)
#>  httr          1.3.1      2017-08-20 [2] CRAN (R 3.4.4)
#>  jsonlite      1.5        2017-06-01 [2] CRAN (R 3.4.4)
#>  knitr         1.20       2018-02-20 [1] CRAN (R 3.4.4)
#>  lattice       0.20-38    2018-11-04 [4] CRAN (R 3.4.4)
#>  lazyeval      0.2.1      2017-10-29 [1] CRAN (R 3.4.4)
#>  lubridate     1.7.4      2018-04-11 [1] CRAN (R 3.4.4)
#>  magrittr      1.5        2014-11-22 [1] CRAN (R 3.4.4)
#>  memoise       1.1.0      2017-04-21 [2] CRAN (R 3.4.4)
#>  modelr        0.1.2      2018-05-11 [1] CRAN (R 3.4.4)
#>  munsell       0.5.0      2018-06-12 [1] CRAN (R 3.4.4)
#>  nlme          3.1-137    2018-04-07 [4] CRAN (R 3.4.4)
#>  pillar        1.3.0      2018-07-14 [1] CRAN (R 3.4.4)
#>  pkgbuild      1.0.2      2018-10-16 [1] CRAN (R 3.4.4)
#>  pkgconfig     2.0.2      2018-08-16 [1] CRAN (R 3.4.4)
#>  pkgload       1.0.2      2018-10-29 [1] CRAN (R 3.4.4)
#>  plyr          1.8.4      2016-06-08 [1] CRAN (R 3.4.4)
#>  prettyunits   1.0.2      2015-07-13 [1] CRAN (R 3.4.4)
#>  processx      3.2.0      2018-08-16 [1] CRAN (R 3.4.4)
#>  ps            1.2.1      2018-11-06 [1] CRAN (R 3.4.4)
#>  purrr       * 0.2.5      2018-05-29 [1] CRAN (R 3.4.4)
#>  R6            2.3.0      2018-10-04 [1] CRAN (R 3.4.4)
#>  Rcpp          1.0.0      2018-11-07 [1] CRAN (R 3.4.4)
#>  readr       * 1.2.1      2018-11-22 [1] CRAN (R 3.4.4)
#>  readxl        1.1.0      2018-04-20 [1] CRAN (R 3.4.4)
#>  remotes       2.0.2      2018-10-30 [1] CRAN (R 3.4.4)
#>  rlang         0.3.0.1    2018-10-25 [1] CRAN (R 3.4.4)
#>  rmarkdown     1.10       2018-06-11 [1] CRAN (R 3.4.4)
#>  rprojroot     1.3-2      2018-01-03 [1] CRAN (R 3.4.4)
#>  rvest         0.3.2      2016-06-17 [1] CRAN (R 3.4.4)
#>  scales        1.0.0      2018-08-09 [1] CRAN (R 3.4.4)
#>  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.4.4)
#>  stringi       1.2.4      2018-07-20 [1] CRAN (R 3.4.4)
#>  stringr     * 1.3.1      2018-05-10 [1] CRAN (R 3.4.4)
#>  testthat      2.0.1      2018-10-13 [1] CRAN (R 3.4.4)
#>  tibble      * 1.4.2      2018-01-22 [1] CRAN (R 3.4.4)
#>  tidyr       * 0.8.2      2018-10-28 [1] CRAN (R 3.4.4)
#>  tidyselect    0.2.5      2018-10-11 [1] CRAN (R 3.4.4)
#>  tidyverse   * 1.2.1      2017-11-14 [1] CRAN (R 3.4.4)
#>  usethis       1.4.0      2018-08-14 [1] CRAN (R 3.4.4)
#>  utf8          1.1.4      2018-05-24 [1] CRAN (R 3.4.4)
#>  withr         2.1.2      2018-03-15 [2] CRAN (R 3.4.4)
#>  xml2          1.2.0.9000 2018-11-23 [1] Github (r-lib/xml2@de9781d)
#>  yaml          2.2.0      2018-07-25 [1] CRAN (R 3.4.4)
#>
#> [1] /home/karlo/R/x86_64-pc-linux-gnu-library/3.4
#> [2] /usr/local/lib/R/site-library
#> [3] /usr/lib/R/site-library
#> [4] /usr/lib/R/library
```

</details>
