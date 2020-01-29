```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

filter_select_plot <- 
  . %>% 
  filter(am == 1) %>% 
  select(mpg, cyl) %>% 
  plot()

mtcars %>% 
  filter_select_plot(.)

#' ![](reprex_reprex_files/figure-markdown_strict/reprex-body-1.png)
```


