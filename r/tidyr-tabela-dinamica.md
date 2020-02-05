# Tabela dinâmica

```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

species_table <- 
  tribble(
  ~plot, ~species, ~abundance,
  "p1", "spA", 3,
  "p1", "spB", 1,
  "p2", "spB", 3,
  "p3", "spA", 2,
  "p3", "spC", 1
)

species_table
#> # A tibble: 5 x 3
#>   plot  species abundance
#>   <chr> <chr>       <dbl>
#> 1 p1    spA             3
#> 2 p1    spB             1
#> 3 p2    spB             3
#> 4 p3    spA             2
#> 5 p3    spC             1

species_table %>% 
  pivot_wider(
    names_from = species, 
    values_from = abundance,
    values_fill = list(abundance = 0)
    )
#> # A tibble: 3 x 4
#>   plot    spA   spB   spC
#>   <chr> <dbl> <dbl> <dbl>
#> 1 p1        3     1     0
#> 2 p2        0     3     0
#> 3 p3        2     0     1

species_table %>% 
  pivot_wider(
    names_from = species, 
    values_from = abundance,
    values_fill = list(abundance = 0)
  ) %>%
  column_to_rownames("plot")
#>    spA spB spC
#> p1   3   1   0
#> p2   0   3   0
#> p3   2   0   1
```


