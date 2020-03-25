``` r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

field_data <-
  tibble::tribble(
    ~plot, ~species,    ~temp,  ~oil, ~rock,
    "p1",      "a",   "high", "yes",    4,
    "p1",      "a",    "low",  "no",    3,
    "p1",      "b", "medium",  "no",    3,
    "p2",      "b", "medium", "yes",    3,
    "p2",      "b", "medium", "yes",    2,
    "p3",      "c",    "low", "yes",    1,
    "p3",      "a",    "low", "yes",    4,
    "p3",      "c",    "low", "yes",    5,
    "p3",      "b",    "low", "yes",    4,
    "p1",      "a",    "low",  "no",    3,
    "p2",      "b",    "low", "yes",    4,
    "p3",      "b",   "high",  "no",    2,
    "p2",      "c",   "high", "yes",    5,
    "p2",      "c",   "high",  "no",    1
  ) 

############################################################
#                                                          #
#                    mapping each step                     #
#                                                          #
############################################################

field_data %>% 
  mutate_if(is.numeric,  as.factor) %>% 
  split(.$species) %>% 
  map(
    ~ pivot_longer(data = .x, cols = c(species, temp, oil, rock))
  ) %>% 
  map(
    ~ mutate(
      .data = .x,
      name_value = paste0(name, "_", value),
      count_name_value = 1
    ) 
  ) %>% 
  map(
    ~ select(.data = .x, -name, -value)
  ) %>% 
  map(
    ~ pivot_wider(
      data = .x,
      names_from = name_value,
      values_from = count_name_value,
      values_fill = list(count_name_value = 0),
      values_fn = list(count_name_value = sum)
    )
  ) %>% 
  map(
    ~ select(.data = .x, plot, contains("species"), order(colnames(.)))
  )
#> $a
#> # A tibble: 2 x 8
#>   plot  species_a oil_no oil_yes rock_3 rock_4 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p1            3      2       1      2      1         1        2
#> 2 p3            1      0       1      0      1         0        1
#> 
#> $b
#> # A tibble: 3 x 10
#>   plot  species_b oil_no oil_yes rock_2 rock_3 rock_4 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p1            1      1       0      0      1      0         0        0
#> 2 p2            3      0       3      1      1      1         0        1
#> 3 p3            2      1       1      1      0      1         1        1
#> # … with 1 more variable: temp_medium <dbl>
#> 
#> $c
#> # A tibble: 2 x 8
#>   plot  species_c oil_no oil_yes rock_1 rock_5 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p3            2      0       2      1      1         0        2
#> 2 p2            2      1       1      1      1         2        0

############################################################
#                                                          #
#      mapping via a composed function: the clean way      #
#                                                          #
############################################################

pivot_clean <- function(df) {
  
  df %>% 
    pivot_longer(cols = c(species, temp, oil, rock)) %>% 
    mutate(name_value = paste0(name, "_", value), count_name_value = 1) %>% 
    select(-name, -value) %>% 
    pivot_wider(
       names_from = name_value,
       values_from = count_name_value,
       values_fill = list(count_name_value = 0),
       values_fn = list(count_name_value = sum)
    ) %>% 
    select(plot, contains("species"), order(colnames(.)))
             
}

field_data %>% 
  mutate_if(is.numeric,  as.factor) %>% 
  split(.$species) %>% 
  map(~ pivot_clean(.x))
#> $a
#> # A tibble: 2 x 8
#>   plot  species_a oil_no oil_yes rock_3 rock_4 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p1            3      2       1      2      1         1        2
#> 2 p3            1      0       1      0      1         0        1
#> 
#> $b
#> # A tibble: 3 x 10
#>   plot  species_b oil_no oil_yes rock_2 rock_3 rock_4 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p1            1      1       0      0      1      0         0        0
#> 2 p2            3      0       3      1      1      1         0        1
#> 3 p3            2      1       1      1      0      1         1        1
#> # … with 1 more variable: temp_medium <dbl>
#> 
#> $c
#> # A tibble: 2 x 8
#>   plot  species_c oil_no oil_yes rock_1 rock_5 temp_high temp_low
#>   <chr>     <dbl>  <dbl>   <dbl>  <dbl>  <dbl>     <dbl>    <dbl>
#> 1 p3            2      0       2      1      1         0        2
#> 2 p2            2      1       1      1      1         2        0
```

<sup>Created on 2020-03-11 by the [reprex package](https://reprex.tidyverse.org) (v0.3.0)</sup>
