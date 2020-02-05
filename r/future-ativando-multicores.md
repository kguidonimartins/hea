```r
if (!require("future")) install.packages("future")
if (!require("parallel")) install.packages("parallel")

plan(multicore(workers = availableCores() - 1))
```


