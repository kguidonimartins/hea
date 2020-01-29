```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

tidy_lm <- 
  purrr::compose(
    lm,
    ~ broom::tidy(.x, conf.int = TRUE),
    ~ filter(.x, p.value < 0.05),
    ~ arrange(.x, desc(statistic)),
    .dir = "forward"
  )

tidy_lm(Sepal.Length ~ Species, data = iris)
#> # A tibble: 3 x 7
#>   term              estimate std.error statistic   p.value conf.low conf.high
#>   <chr>                <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
#> 1 (Intercept)           5.01    0.0728     68.8  1.13e-113    4.86       5.15
#> 2 Speciesvirginica      1.58    0.103      15.4  2.21e- 32    1.38       1.79
#> 3 Speciesversicolor     0.93    0.103       9.03 8.77e- 16    0.727      1.13
```

Fonte: https://github.com/jgutman/rstudio-conf-20/blob/master/RStudio%20Conference%202020%20-%20Jackie%20Gutman.pdf
