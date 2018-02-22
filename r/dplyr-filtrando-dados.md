# Filtrando dados com dplyr



### Instale o pacote `dplyr` e o `nycflights13` (que contém os dados de exemplo)
```r
if (!require("dplyr")) install.packages("dplyr")
if (!require("nycflights13")) install.packages("nycflights13")
```



### Cheque a estrutura dos dados

```r
str(flights)
```

```r
## Classes 'tbl_df', 'tbl' and 'data.frame':    336776 obs. of  19 variables:
##  $ year          : int  2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 ...
##  $ month         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ day           : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ dep_time      : int  517 533 542 544 554 554 555 557 557 558 ...
##  $ sched_dep_time: int  515 529 540 545 600 558 600 600 600 600 ...
##  $ dep_delay     : num  2 4 2 -1 -6 -4 -5 -3 -3 -2 ...
##  $ arr_time      : int  830 850 923 1004 812 740 913 709 838 753 ...
##  $ sched_arr_time: int  819 830 850 1022 837 728 854 723 846 745 ...
##  $ arr_delay     : num  11 20 33 -18 -25 12 19 -14 -8 8 ...
##  $ carrier       : chr  "UA" "UA" "AA" "B6" ...
##  $ flight        : int  1545 1714 1141 725 461 1696 507 5708 79 301 ...
##  $ tailnum       : chr  "N14228" "N24211" "N619AA" "N804JB" ...
##  $ origin        : chr  "EWR" "LGA" "JFK" "JFK" ...
##  $ dest          : chr  "IAH" "IAH" "MIA" "BQN" ...
##  $ air_time      : num  227 227 160 183 116 150 158 53 140 138 ...
##  $ distance      : num  1400 1416 1089 1576 762 ...
##  $ hour          : num  5 5 5 5 6 5 6 6 6 6 ...
##  $ minute        : num  15 29 40 45 0 58 0 0 0 0 ...
##  $ time_hour     : POSIXct, format: "2013-01-01 05:00:00" "2013-01-01 05:00:00"
...
```

### Cheque nomes

```r
flights %>% names()
```

```r
##  [1] "year"           "month"          "day"            "dep_time"
##  [5] "sched_dep_time" "dep_delay"      "arr_time"       "sched_arr_time"
##  [9] "arr_delay"      "carrier"        "flight"         "tailnum"
## [13] "origin"         "dest"           "air_time"       "distance"
## [17] "hour"           "minute"         "time_hour"
```

### Selecione algumas colunas e filtre por valores

```r
flights %>%
  select(year, carrier, origin, distance) %>%
  filter(carrier == "UA" & origin == "EWR")
```

```r
## # A tibble: 46,087 x 4
##     year carrier origin distance
##    <int> <chr>   <chr>     <dbl>
##  1  2013 UA      EWR        1400
##  2  2013 UA      EWR         719
##  3  2013 UA      EWR        2565
##  4  2013 UA      EWR        2227
##  5  2013 UA      EWR        1085
##  6  2013 UA      EWR        2454
##  7  2013 UA      EWR        1023
##  8  2013 UA      EWR        1065
##  9  2013 UA      EWR        2434
## 10  2013 UA      EWR         997
## # ... with 46,077 more rows
```

### Selecione algumas colunas e filtre por múltiplos valores

```r
flights %>%
  select(year, carrier, origin, distance) %>%
  filter(carrier == c("UA", "AA"))
```

```r
## # A tibble: 45,513 x 4
##     year carrier origin distance
##    <int> <chr>   <chr>     <dbl>
##  1  2013 UA      EWR        1400
##  2  2013 AA      LGA         733
##  3  2013 UA      JFK        2475
##  4  2013 UA      EWR        2227
##  5  2013 UA      EWR        1085
##  6  2013 UA      JFK        2586
##  7  2013 AA      LGA        1096
##  8  2013 UA      LGA        1416
##  9  2013 UA      EWR        2434
## 10  2013 AA      LGA         733
## # ... with 45,503 more rows
```

### Usando o `%in%`

```r
flights %>%
  select(year, carrier, origin, distance) %>%
  filter(carrier %in% c("UA", "AA"))
```

```r
## # A tibble: 91,394 x 4
##     year carrier origin distance
##    <int> <chr>   <chr>     <dbl>
##  1  2013 UA      EWR        1400
##  2  2013 UA      LGA        1416
##  3  2013 AA      JFK        1089
##  4  2013 UA      EWR         719
##  5  2013 AA      LGA         733
##  6  2013 UA      JFK        2475
##  7  2013 UA      EWR        2565
##  8  2013 AA      LGA        1389
##  9  2013 UA      EWR        2227
## 10  2013 AA      EWR        1085
## # ... with 91,384 more rows
```

### Contabilizando ocorrências

```r
flights %>%
  select(year, carrier, origin, distance) %>%
  filter(carrier %in% c("UA", "AA")) %>%
  count(carrier)
```

```r
## # A tibble: 2 x 2
##   carrier     n
##   <chr>   <int>
## 1 AA      32729
## 2 UA      58665
```

### Contabilizando ocorrências em ordem reversa

```r
flights %>%
  select(year, carrier, origin, distance) %>%
  filter(!carrier %in% c("UA", "AA")) %>%
  count(carrier)
```

```r
## # A tibble: 14 x 2
##    carrier     n
##    <chr>   <int>
##  1 9E      18460
##  2 AS        714
##  3 B6      54635
##  4 DL      48110
##  5 EV      54173
##  6 F9        685
##  7 FL       3260
##  8 HA        342
##  9 MQ      26397
## 10 OO         32
## 11 US      20536
## 12 VX       5162
## 13 WN      12275
## 14 YV        601
```

### Filtrando valores ausentes

```r
flights %>%
  select(year, carrier, origin, distance, dep_delay) %>%
  filter(is.na(dep_delay))
```

```r
## # A tibble: 8,255 x 5
##     year carrier origin distance dep_delay
##    <int> <chr>   <chr>     <dbl>     <dbl>
##  1  2013 EV      EWR         416        NA
##  2  2013 AA      LGA        1389        NA
##  3  2013 AA      LGA        1096        NA
##  4  2013 B6      JFK        1069        NA
##  5  2013 EV      EWR         569        NA
##  6  2013 EV      EWR         319        NA
##  7  2013 EV      EWR         209        NA
##  8  2013 EV      EWR         746        NA
##  9  2013 EV      EWR         645        NA
## 10  2013 AA      JFK        2475        NA
## # ... with 8,245 more rows
```

### Excluindo valores ausentes

```r
flights %>%
  select(year, carrier, origin, distance, dep_delay) %>%
  filter(!is.na(dep_delay))
```

```r
## # A tibble: 328,521 x 5
##     year carrier origin distance dep_delay
##    <int> <chr>   <chr>     <dbl>     <dbl>
##  1  2013 UA      EWR        1400      2.00
##  2  2013 UA      LGA        1416      4.00
##  3  2013 AA      JFK        1089      2.00
##  4  2013 B6      JFK        1576     -1.00
##  5  2013 DL      LGA         762     -6.00
##  6  2013 UA      EWR         719     -4.00
##  7  2013 B6      EWR        1065     -5.00
##  8  2013 EV      LGA         229     -3.00
##  9  2013 B6      JFK         944     -3.00
## 10  2013 AA      LGA         733     -2.00
## # ... with 328,511 more rows
```

[Fonte](https://blog.exploratory.io/filter-data-with-dplyr-76cf5f1a258e)
