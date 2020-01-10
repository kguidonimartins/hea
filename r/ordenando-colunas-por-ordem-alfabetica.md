```r
if (!require("tidyverse")) install.packages("tidyverse")

mtcars %>%
  rownames_to_column("car") %>%
  select(car, order(colnames(.)))

order_columns <- function(x) {
  order(colnames(x))
}

mtcars %>%
  rownames_to_column("car") %>%
  select(car, order_columns(.))
```

Fonte: https://stackoverflow.com/a/29873357/5974372
