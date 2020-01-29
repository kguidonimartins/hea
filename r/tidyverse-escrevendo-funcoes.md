```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

# Subset .data
group_mean_dot_data <- function(data, var, by) {
  data %>%
    group_by(.data[[by]]) %>%
    summarise(average = mean(.data[[var]], na.rm = TRUE))
}

diamonds %>% 
  group_mean_dot_data(var = "price", by = "cut")
#> # A tibble: 5 x 2
#>   cut       average
#>   <ord>       <dbl>
#> 1 Fair        4359.
#> 2 Good        3929.
#> 3 Very Good   3982.
#> 4 Premium     4584.
#> 5 Ideal       3458.

# Embracing args
group_mean_curly_brackets <- function(data, var, by) {
  data %>%
    group_by({{ by }}) %>%
    summarise(average = mean({{ var  }}, na.rm = TRUE))
}

diamonds %>% 
  group_mean_curly_brackets(var = price, by = cut)
#> # A tibble: 5 x 2
#>   cut       average
#>   <ord>       <dbl>
#> 1 Fair        4359.
#> 2 Good        3929.
#> 3 Very Good   3982.
#> 4 Premium     4584.
#> 5 Ideal       3458.
```

Fonte: https://speakerdeck.com/lionelhenry/reusing-tidyverse-code
