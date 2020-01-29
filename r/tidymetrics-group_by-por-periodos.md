```r
if (!require("tidyverse")) install.packages("tidyverse")
#> Loading required package: tidyverse

if (!require("devtools")) install.packages("devtools")
#> Loading required package: devtools
#> Loading required package: usethis

if (!require("tidymetrics")) install_github("ramnathv/tidymetrics")
#> Loading required package: tidymetrics
#> 
#> Attaching package: 'tidymetrics'
#> The following object is masked from 'package:stats':
#> 
#>     filter

if (!require("nycflights13")) install.packages("nycflights13")
#> Loading required package: nycflights13

flights %>%
  mutate(date = as.Date(ISOdate(year, month, day))) %>%
  cross_by_dimensions(origin, carrier) %>%
  cross_by_periods("day") %>%
  summarize(n = n()) %>% 
  arrange(desc(date))
#> # A tibble: 18,756 x 5
#> # Groups:   origin, carrier, period [55]
#>    origin carrier period date       nb_flights
#>    <chr>  <chr>   <chr>  <date>          <int>
#>  1 All    9E      day    2013-12-31         36
#>  2 All    AA      day    2013-12-31         77
#>  3 All    All     day    2013-12-31        776
#>  4 All    AS      day    2013-12-31          2
#>  5 All    B6      day    2013-12-31        161
#>  6 All    DL      day    2013-12-31        124
#>  7 All    EV      day    2013-12-31         86
#>  8 All    F9      day    2013-12-31          1
#>  9 All    FL      day    2013-12-31          7
#> 10 All    HA      day    2013-12-31          1
#> # … with 18,746 more rows

flights %>%
  mutate(date = as.Date(ISOdate(year, month, day))) %>%
  cross_by_dimensions(origin, carrier) %>%
  cross_by_periods("week") %>%
  summarize(n = n()) %>% 
  arrange(desc(date))
#> # A tibble: 2,768 x 5
#> # Groups:   origin, carrier, period [55]
#>    origin carrier period date       nb_flights
#>    <chr>  <chr>   <chr>  <date>          <int>
#>  1 All    9E      week   2013-12-30         82
#>  2 All    AA      week   2013-12-30        169
#>  3 All    All     week   2013-12-30       1744
#>  4 All    AS      week   2013-12-30          4
#>  5 All    B6      week   2013-12-30        326
#>  6 All    DL      week   2013-12-30        270
#>  7 All    EV      week   2013-12-30        243
#>  8 All    F9      week   2013-12-30          3
#>  9 All    FL      week   2013-12-30         14
#> 10 All    HA      week   2013-12-30          2
#> # … with 2,758 more rows

flights %>%
  mutate(date = as.Date(ISOdate(year, month, day))) %>%
  cross_by_dimensions(origin) %>%
  cross_by_periods("week") %>%
  summarize(n = n()) %>% 
  arrange(desc(date)) 
#> # A tibble: 212 x 4
#> # Groups:   origin, period [4]
#>    origin period date       nb_flights
#>    <chr>  <chr>  <date>          <int>
#>  1 All    week   2013-12-30       1744
#>  2 EWR    week   2013-12-30        624
#>  3 JFK    week   2013-12-30        595
#>  4 LGA    week   2013-12-30        525
#>  5 All    week   2013-12-23       6066
#>  6 EWR    week   2013-12-23       2095
#>  7 JFK    week   2013-12-23       2114
#>  8 LGA    week   2013-12-23       1857
#>  9 All    week   2013-12-16       6529
#> 10 EWR    week   2013-12-16       2299
#> # … with 202 more rows

flights %>%
  mutate(date = as.Date(ISOdate(year, month, day))) %>%
  cross_by_dimensions(origin, carrier) %>%
  cross_by_periods("month") %>%
  summarize(n = n()) %>% 
  arrange(desc(date))
#> # A tibble: 632 x 5
#> # Groups:   origin, carrier, period [55]
#>    origin carrier period date       nb_flights
#>    <chr>  <chr>   <chr>  <date>          <int>
#>  1 All    9E      month  2013-12-01       1633
#>  2 All    AA      month  2013-12-01       2705
#>  3 All    All     month  2013-12-01      28135
#>  4 All    AS      month  2013-12-01         54
#>  5 All    B6      month  2013-12-01       4741
#>  6 All    DL      month  2013-12-01       4093
#>  7 All    EV      month  2013-12-01       4307
#>  8 All    F9      month  2013-12-01         61
#>  9 All    FL      month  2013-12-01        213
#> 10 All    HA      month  2013-12-01         28
#> # … with 622 more rows
```


