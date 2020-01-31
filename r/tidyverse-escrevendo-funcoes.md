```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

############################################################
#                                                          #
#                       Subset .data                       #
#                                                          #
############################################################

group_mean_dot_data <- function(data, by, var) {
  data %>%
    group_by(.data[[by]]) %>%
    summarise(average = mean(.data[[var]], na.rm = TRUE))
}

diamonds %>% 
  group_mean_dot_data(by = "cut", var = "price")
#> # A tibble: 5 x 2
#>   cut       average
#>   <ord>       <dbl>
#> 1 Fair        4359.
#> 2 Good        3929.
#> 3 Very Good   3982.
#> 4 Premium     4584.
#> 5 Ideal       3458.

############################################################
#                                                          #
#                Embracing args hardcoded                  #
#                                                          #
############################################################

group_mean_curly_brackets_hardcoded <- function(data, by, var) {
  data %>%
    group_by({{ by }}) %>%
    summarise(average = mean({{ var }}, na.rm = TRUE))
}

diamonds %>% 
  group_mean_curly_brackets_hardcoded(by = cut, var = price)
#> # A tibble: 5 x 2
#>   cut       average
#>   <ord>       <dbl>
#> 1 Fair        4359.
#> 2 Good        3929.
#> 3 Very Good   3982.
#> 4 Premium     4584.
#> 5 Ideal       3458.

############################################################
#                                                          #
#                       Mixing both                        #
#                                                          #
############################################################

group_mean_curly_brackets_sweet <- function(data, by, var) {
  data %>%
    group_by(.data[[by]]) %>%
    summarise("average_{ var }" := mean(.data[[var]], na.rm = TRUE))
}

diamonds %>% 
  group_mean_curly_brackets_sweet(by = "cut", var = "price")
#> # A tibble: 5 x 2
#>   cut       average_price
#>   <ord>             <dbl>
#> 1 Fair              4359.
#> 2 Good              3929.
#> 3 Very Good         3982.
#> 4 Premium           4584.
#> 5 Ideal             3458.
```

Fonte: https://speakerdeck.com/lionelhenry/reusing-tidyverse-code
Fonte: https://speakerdeck.com/lionelhenry/interactivity-and-programming-in-the-tidyverse?slide=25
