```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

n <- 100
data <- data.frame(x = 1, n = 2)

data %>% 
  mutate(y = .data$x / .env$n)
#>   x n    y
#> 1 1 2 0.01
```


