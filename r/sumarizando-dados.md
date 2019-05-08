https://dabblingwithdata.wordpress.com/2018/01/02/my-favourite-r-package-for-summarising-data/

https://github.com/dcomtois/summarytools

```{r}
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("skimr")) install.packages("skimr")
```

```{r}
mtcars
```

```{r}
mtcars %>%
    select_if(is.numeric) %>%
    skim()
```
