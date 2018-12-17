# Sobreescrevendo os dados com pipe do pacote `magrittr`


O pacote `magrittr` faz parte do tidyverse mas não dos pacotes *core*. Então, ele precisa ser carregado separadamente.

```{r}
library(tidyverse)
library(magrittr)

# load data
mtcars
```

Em algumas ocasiões, após aplicar uma sequência de *pipes* (`%>%`) aos dados, criamos um novo objeto. Por exemplo:

```{r}
# aplicando pipe sem  criar um novo objeto
mtcars %>%
    select(mpg, cyl)

# aplicando pipe criando um novo objeto
mtcars <-
mtcars %>%
    select(mpg, cyl)
```

Como você pode reparar na operação acima, os dados originais foram sobreescritos. Para isso, precisamos digitar o nome do objeto duas vezes (`mtcars <- mtcars %>%`). No entanto, existe uma forma mais simples de sobreescrever os dados. A mudança é sutil, perceba:

```{r}
mtcars %<>%
    select(mpg, cyl)

# veja o dataset
mtcars
```
