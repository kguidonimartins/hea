# Expandindo linhas de um dataframe 

```r
if (!require("tidyr")) install.packages("tidyr")
#> Loading required package: tidyr

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
  uncount(weights = abundance)
#> # A tibble: 10 x 2
#>    plot  species
#>    <chr> <chr>  
#>  1 p1    spA    
#>  2 p1    spA    
#>  3 p1    spA    
#>  4 p1    spB    
#>  5 p2    spB    
#>  6 p2    spB    
#>  7 p2    spB    
#>  8 p3    spA    
#>  9 p3    spA    
#> 10 p3    spC
```


