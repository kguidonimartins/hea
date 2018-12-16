# Cheque se as colunas têm NA

```r
library(tidyverse)

mtcars %>%
  map_df(~ sum(is.na(.)))
```
