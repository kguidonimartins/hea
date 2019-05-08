library(tidyr)
library(dplyr)
library(readr) 

pew <- read_csv("pew.csv", col_types = list())
pew
#> # A tibble: 18 x 11
#>    religion `<$10k` `$10-20k` `$20-30k` `$30-40k` `$40-50k` `$50-75k`
#>    <chr>      <dbl>     <dbl>     <dbl>     <dbl>     <dbl>     <dbl>
#>  1 Agnostic      27        34        60        81        76       137
#>  2 Atheist       12        27        37        52        35        70
#>  3 Buddhist      27        21        30        34        33        58
#>  4 Catholic     418       617       732       670       638      1116
#>  5 Don’t k…      15        14        15        11        10        35
#>  6 Evangel…     575       869      1064       982       881      1486
#>  7 Hindu          1         9         7         9        11        34
#>  8 Histori…     228       244       236       238       197       223
#>  9 Jehovah…      20        27        24        24        21        30
#> 10 Jewish        19        19        25        25        30        95
#> # … with 8 more rows, and 4 more variables: `$75-100k` <dbl>,
#> #   `$100-150k` <dbl>, `>150k` <dbl>, `Don't know/refused` <dbl> 

pew %>% 
  pivot_long(cols = -religion, names_to = "income", values_to = "count")
#> # A tibble: 180 x 3
#>    religion income             count
#>    <chr>    <chr>              <dbl>
#>  1 Agnostic <$10k                 27
#>  2 Agnostic $10-20k               34
#>  3 Agnostic $20-30k               60
#>  4 Agnostic $30-40k               81
#>  5 Agnostic $40-50k               76
#>  6 Agnostic $50-75k              137
#>  7 Agnostic $75-100k             122
#>  8 Agnostic $100-150k            109
#>  9 Agnostic >150k                 84
#> 10 Agnostic Don't know/refused    96
#> # … with 170 more rows 

billboard <- read_csv("billboard.csv", col_types = list(time = col_skip()))
billboard
#> # A tibble: 317 x 80
#>     year artist track date.entered   wk1   wk2   wk3   wk4   wk5   wk6
#>    <dbl> <chr>  <chr> <date>       <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  2000 2 Pac  Baby… 2000-02-26      87    82    72    77    87    94
#>  2  2000 2Ge+h… The … 2000-09-02      91    87    92    NA    NA    NA
#>  3  2000 3 Doo… Kryp… 2000-04-08      81    70    68    67    66    57
#>  4  2000 3 Doo… Loser 2000-10-21      76    76    72    69    67    65
#>  5  2000 504 B… Wobb… 2000-04-15      57    34    25    17    17    31
#>  6  2000 98^0   Give… 2000-08-19      51    39    34    26    26    19
#>  7  2000 A*Tee… Danc… 2000-07-08      97    97    96    95   100    NA
#>  8  2000 Aaliy… I Do… 2000-01-29      84    62    51    41    38    35
#>  9  2000 Aaliy… Try … 2000-03-18      59    53    38    28    21    18
#> 10  2000 Adams… Open… 2000-08-26      76    76    74    69    68    67
#> # … with 307 more rows, and 70 more variables: wk7 <dbl>, wk8 <dbl>,
#> #   wk9 <dbl>, wk10 <dbl>, wk11 <dbl>, wk12 <dbl>, wk13 <dbl>, wk14 <dbl>,
#> #   wk15 <dbl>, wk16 <dbl>, wk17 <dbl>, wk18 <dbl>, wk19 <dbl>,
#> #   wk20 <dbl>, wk21 <dbl>, wk22 <dbl>, wk23 <dbl>, wk24 <dbl>,
#> #   wk25 <dbl>, wk26 <dbl>, wk27 <dbl>, wk28 <dbl>, wk29 <dbl>,
#> #   wk30 <dbl>, wk31 <dbl>, wk32 <dbl>, wk33 <dbl>, wk34 <dbl>,
#> #   wk35 <dbl>, wk36 <dbl>, wk37 <dbl>, wk38 <dbl>, wk39 <dbl>,
#> #   wk40 <dbl>, wk41 <dbl>, wk42 <dbl>, wk43 <dbl>, wk44 <dbl>,
#> #   wk45 <dbl>, wk46 <dbl>, wk47 <dbl>, wk48 <dbl>, wk49 <dbl>,
#> #   wk50 <dbl>, wk51 <dbl>, wk52 <dbl>, wk53 <dbl>, wk54 <dbl>,
#> #   wk55 <dbl>, wk56 <dbl>, wk57 <dbl>, wk58 <dbl>, wk59 <dbl>,
#> #   wk60 <dbl>, wk61 <dbl>, wk62 <dbl>, wk63 <dbl>, wk64 <dbl>,
#> #   wk65 <dbl>, wk66 <lgl>, wk67 <lgl>, wk68 <lgl>, wk69 <lgl>,
#> #   wk70 <lgl>, wk71 <lgl>, wk72 <lgl>, wk73 <lgl>, wk74 <lgl>,
#> #   wk75 <lgl>, wk76 <lgl> 

billboard %>% 
  pivot_long(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank",
    na.rm = TRUE
  )
#> # A tibble: 5,307 x 6
#>     year artist  track                   date.entered week   rank
#>    <dbl> <chr>   <chr>                   <date>       <chr> <dbl>
#>  1  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk1      87
#>  2  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk2      82
#>  3  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk3      72
#>  4  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk4      77
#>  5  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk5      87
#>  6  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk6      94
#>  7  2000 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk7      99
#>  8  2000 2Ge+her The Hardest Part Of ... 2000-09-02   wk1      91
#>  9  2000 2Ge+her The Hardest Part Of ... 2000-09-02   wk2      87
#> 10  2000 2Ge+her The Hardest Part Of ... 2000-09-02   wk3      92
#> # … with 5,297 more rows 

spec <- billboard %>% 
  pivot_long_spec(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank"
  )
spec
#> # A tibble: 76 x 3
#>    .name .value week 
#>    <chr> <chr>  <chr>
#>  1 wk1   rank   wk1  
#>  2 wk2   rank   wk2  
#>  3 wk3   rank   wk3  
#>  4 wk4   rank   wk4  
#>  5 wk5   rank   wk5  
#>  6 wk6   rank   wk6  
#>  7 wk7   rank   wk7  
#>  8 wk8   rank   wk8  
#>  9 wk9   rank   wk9  
#> 10 wk10  rank   wk10 
#> # … with 66 more rows 

spec <- spec %>% 
  mutate(week = parse_number(week))
spec
#> # A tibble: 76 x 3
#>    .name .value  week
#>    <chr> <chr>  <dbl>
#>  1 wk1   rank       1
#>  2 wk2   rank       2
#>  3 wk3   rank       3
#>  4 wk4   rank       4
#>  5 wk5   rank       5
#>  6 wk6   rank       6
#>  7 wk7   rank       7
#>  8 wk8   rank       8
#>  9 wk9   rank       9
#> 10 wk10  rank      10
#> # … with 66 more rows 

billboard %>% 
  pivot_long(spec = spec)
#> # A tibble: 24,092 x 6
#>     year artist track                   date.entered  week  rank
#>    <dbl> <chr>  <chr>                   <date>       <dbl> <dbl>
#>  1  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       1    87
#>  2  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       2    82
#>  3  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       3    72
#>  4  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       4    77
#>  5  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       5    87
#>  6  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       6    94
#>  7  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       7    99
#>  8  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       8    NA
#>  9  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26       9    NA
#> 10  2000 2 Pac  Baby Don't Cry (Keep... 2000-02-26      10    NA
#> # … with 24,082 more rows 

who
#> # A tibble: 7,240 x 60
#>    country iso2  iso3   year new_sp_m014 new_sp_m1524 new_sp_m2534
#>    <chr>   <chr> <chr> <int>       <int>        <int>        <int>
#>  1 Afghan… AF    AFG    1980          NA           NA           NA
#>  2 Afghan… AF    AFG    1981          NA           NA           NA
#>  3 Afghan… AF    AFG    1982          NA           NA           NA
#>  4 Afghan… AF    AFG    1983          NA           NA           NA
#>  5 Afghan… AF    AFG    1984          NA           NA           NA
#>  6 Afghan… AF    AFG    1985          NA           NA           NA
#>  7 Afghan… AF    AFG    1986          NA           NA           NA
#>  8 Afghan… AF    AFG    1987          NA           NA           NA
#>  9 Afghan… AF    AFG    1988          NA           NA           NA
#> 10 Afghan… AF    AFG    1989          NA           NA           NA
#> # … with 7,230 more rows, and 53 more variables: new_sp_m3544 <int>,
#> #   new_sp_m4554 <int>, new_sp_m5564 <int>, new_sp_m65 <int>,
#> #   new_sp_f014 <int>, new_sp_f1524 <int>, new_sp_f2534 <int>,
#> #   new_sp_f3544 <int>, new_sp_f4554 <int>, new_sp_f5564 <int>,
#> #   new_sp_f65 <int>, new_sn_m014 <int>, new_sn_m1524 <int>,
#> #   new_sn_m2534 <int>, new_sn_m3544 <int>, new_sn_m4554 <int>,
#> #   new_sn_m5564 <int>, new_sn_m65 <int>, new_sn_f014 <int>,
#> #   new_sn_f1524 <int>, new_sn_f2534 <int>, new_sn_f3544 <int>,
#> #   new_sn_f4554 <int>, new_sn_f5564 <int>, new_sn_f65 <int>,
#> #   new_ep_m014 <int>, new_ep_m1524 <int>, new_ep_m2534 <int>,
#> #   new_ep_m3544 <int>, new_ep_m4554 <int>, new_ep_m5564 <int>,
#> #   new_ep_m65 <int>, new_ep_f014 <int>, new_ep_f1524 <int>,
#> #   new_ep_f2534 <int>, new_ep_f3544 <int>, new_ep_f4554 <int>,
#> #   new_ep_f5564 <int>, new_ep_f65 <int>, newrel_m014 <int>,
#> #   newrel_m1524 <int>, newrel_m2534 <int>, newrel_m3544 <int>,
#> #   newrel_m4554 <int>, newrel_m5564 <int>, newrel_m65 <int>,
#> #   newrel_f014 <int>, newrel_f1524 <int>, newrel_f2534 <int>,
#> #   newrel_f3544 <int>, newrel_f4554 <int>, newrel_f5564 <int>,
#> #   newrel_f65 <int> 

spec <- who %>%
  pivot_long_spec(new_sp_m014:newrel_f65, values_to = "count")
spec
#> # A tibble: 56 x 3
#>    .name        .value name        
#>    <chr>        <chr>  <chr>       
#>  1 new_sp_m014  count  new_sp_m014 
#>  2 new_sp_m1524 count  new_sp_m1524
#>  3 new_sp_m2534 count  new_sp_m2534
#>  4 new_sp_m3544 count  new_sp_m3544
#>  5 new_sp_m4554 count  new_sp_m4554
#>  6 new_sp_m5564 count  new_sp_m5564
#>  7 new_sp_m65   count  new_sp_m65  
#>  8 new_sp_f014  count  new_sp_f014 
#>  9 new_sp_f1524 count  new_sp_f1524
#> 10 new_sp_f2534 count  new_sp_f2534
#> # … with 46 more rows 

spec <- spec %>%
  extract(name, c("diagnosis", "gender", "age"), "new_?(.*)_(.)(.*)")
spec
#> # A tibble: 56 x 5
#>    .name        .value diagnosis gender age  
#>    <chr>        <chr>  <chr>     <chr>  <chr>
#>  1 new_sp_m014  count  sp        m      014  
#>  2 new_sp_m1524 count  sp        m      1524 
#>  3 new_sp_m2534 count  sp        m      2534 
#>  4 new_sp_m3544 count  sp        m      3544 
#>  5 new_sp_m4554 count  sp        m      4554 
#>  6 new_sp_m5564 count  sp        m      5564 
#>  7 new_sp_m65   count  sp        m      65   
#>  8 new_sp_f014  count  sp        f      014  
#>  9 new_sp_f1524 count  sp        f      1524 
#> 10 new_sp_f2534 count  sp        f      2534 
#> # … with 46 more rows 

spec <- spec %>%
  mutate(
    gender = factor(gender, levels = c("f", "m")),
    age = factor(age, levels = unique(age), ordered = TRUE)
  )
spec
#> # A tibble: 56 x 5
#>    .name        .value diagnosis gender age  
#>    <chr>        <chr>  <chr>     <fct>  <ord>
#>  1 new_sp_m014  count  sp        m      014  
#>  2 new_sp_m1524 count  sp        m      1524 
#>  3 new_sp_m2534 count  sp        m      2534 
#>  4 new_sp_m3544 count  sp        m      3544 
#>  5 new_sp_m4554 count  sp        m      4554 
#>  6 new_sp_m5564 count  sp        m      5564 
#>  7 new_sp_m65   count  sp        m      65   
#>  8 new_sp_f014  count  sp        f      014  
#>  9 new_sp_f1524 count  sp        f      1524 
#> 10 new_sp_f2534 count  sp        f      2534 
#> # … with 46 more rows 

who %>% pivot_long(spec = spec)
#> # A tibble: 405,440 x 8
#>    country     iso2  iso3   year diagnosis gender age   count
#>    <chr>       <chr> <chr> <int> <chr>     <fct>  <ord> <int>
#>  1 Afghanistan AF    AFG    1980 sp        m      014      NA
#>  2 Afghanistan AF    AFG    1980 sp        m      1524     NA
#>  3 Afghanistan AF    AFG    1980 sp        m      2534     NA
#>  4 Afghanistan AF    AFG    1980 sp        m      3544     NA
#>  5 Afghanistan AF    AFG    1980 sp        m      4554     NA
#>  6 Afghanistan AF    AFG    1980 sp        m      5564     NA
#>  7 Afghanistan AF    AFG    1980 sp        m      65       NA
#>  8 Afghanistan AF    AFG    1980 sp        f      014      NA
#>  9 Afghanistan AF    AFG    1980 sp        f      1524     NA
#> 10 Afghanistan AF    AFG    1980 sp        f      2534     NA
#> # … with 405,430 more rows 

construction <- read_csv("construction.csv", col_types = list("2 to 4 units" = col_integer()))
construction
#> # A tibble: 10 x 10
#>     Year Month Total `1 unit` `2 to 4 units` `5 units or mor… Northeast
#>    <dbl> <chr> <dbl>    <dbl>          <int>            <dbl>     <dbl>
#>  1  2017 Dece…  1197      837             NA              347       115
#>  2  2018 Janu…  1218      859             NA              348       114
#>  3  2018 Febr…  1289      882             NA              400       138
#>  4  2018 March  1229      862             NA              356       150
#>  5  2018 April  1257      797             NA              447       144
#>  6  2018 May    1251      875             NA              364        90
#>  7  2018 June   1216      867             NA              342        76
#>  8  2018 July   1195      829             NA              360       108
#>  9  2018 Augu…  1230      939             NA              286        90
#> 10  2018 Sept…  1148      835             NA              304       117
#> # … with 3 more variables: Midwest <dbl>, South <dbl>, West <dbl> 

spec <- tribble(
  ~.name,            ~.value, ~units,  ~region,     
  "Total",           "n",     "total", NA,          
  "1 unit",          "n",     "1",     NA,          
  "2 to 4 units",    "n",     "2-4",   NA,          
  "5 units or more", "n",     "5+",    NA,          
  "Northeast",       "n",     NA,      "Northeast", 
  "Midwest",         "n",     NA,      "Midwest",   
  "South",           "n",     NA,      "South",     
  "West",            "n",     NA,      "West",      
) 

construction %>% pivot_long(spec = spec)
#> # A tibble: 80 x 5
#>     Year Month    units region        n
#>    <dbl> <chr>    <chr> <chr>     <dbl>
#>  1  2017 December total <NA>       1197
#>  2  2017 December 1     <NA>        837
#>  3  2017 December 2-4   <NA>         NA
#>  4  2017 December 5+    <NA>        347
#>  5  2017 December <NA>  Northeast   115
#>  6  2017 December <NA>  Midwest     175
#>  7  2017 December <NA>  South       614
#>  8  2017 December <NA>  West        293
#>  9  2018 January  total <NA>       1218
#> 10  2018 January  1     <NA>        859
#> # … with 70 more rows 

family <- tibble::tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~gender_child1, ~gender_child2,
       1L, "1998-11-26", "2000-01-29",             1L,             2L,
       2L, "1996-06-22",           NA,             2L,             NA,
       3L, "2002-07-11", "2004-04-05",             2L,             2L,
       4L, "2004-10-10", "2009-08-27",             1L,             1L,
       5L, "2000-12-05", "2005-02-28",             2L,             1L,
)
family <- family %>% mutate_at(vars(starts_with("dob")), parse_date)
family
#> # A tibble: 5 x 5
#>   family dob_child1 dob_child2 gender_child1 gender_child2
#>    <int> <date>     <date>             <int>         <int>
#> 1      1 1998-11-26 2000-01-29             1             2
#> 2      2 1996-06-22 NA                     2            NA
#> 3      3 2002-07-11 2004-04-05             2             2
#> 4      4 2004-10-10 2009-08-27             1             1
#> 5      5 2000-12-05 2005-02-28             2             1 

spec <- family %>%
  pivot_long_spec(-family) %>%
  separate(name, c(".value", "child")) %>%
  mutate(child = parse_number(child))
spec
#> # A tibble: 4 x 3
#>   .name         .value child
#>   <chr>         <chr>  <dbl>
#> 1 dob_child1    dob        1
#> 2 dob_child2    dob        2
#> 3 gender_child1 gender     1
#> 4 gender_child2 gender     2 

family %>%
  pivot_long(spec = spec, na.rm = TRUE)
#> # A tibble: 9 x 4
#>   family child dob        gender
#>    <int> <dbl> <date>      <int>
#> 1      1     1 1998-11-26      1
#> 2      1     2 2000-01-29      2
#> 3      2     1 1996-06-22      2
#> 4      3     1 2002-07-11      2
#> 5      3     2 2004-04-05      2
#> 6      4     1 2004-10-10      1
#> 7      4     2 2009-08-27      1
#> 8      5     1 2000-12-05      2
#> 9      5     2 2005-02-28      1 

anscombe
#>    x1 x2 x3 x4    y1   y2    y3    y4
#> 1  10 10 10  8  8.04 9.14  7.46  6.58
#> 2   8  8  8  8  6.95 8.14  6.77  5.76
#> 3  13 13 13  8  7.58 8.74 12.74  7.71
#> 4   9  9  9  8  8.81 8.77  7.11  8.84
#> 5  11 11 11  8  8.33 9.26  7.81  8.47
#> 6  14 14 14  8  9.96 8.10  8.84  7.04
#> 7   6  6  6  8  7.24 6.13  6.08  5.25
#> 8   4  4  4 19  4.26 3.10  5.39 12.50
#> 9  12 12 12  8 10.84 9.13  8.15  5.56
#> 10  7  7  7  8  4.82 7.26  6.42  7.91
#> 11  5  5  5  8  5.68 4.74  5.73  6.89 

spec <- anscombe %>% 
  pivot_long_spec(everything()) %>% 
  separate(name, c(".value", "graph"), 1)

anscombe %>% 
  pivot_long(spec = spec) %>% 
  arrange()
#> # A tibble: 44 x 3
#>    graph     x     y
#>    <chr> <dbl> <dbl>
#>  1 1        10  8.04
#>  2 2        10  9.14
#>  3 3        10  7.46
#>  4 4         8  6.58
#>  5 1         8  6.95
#>  6 2         8  8.14
#>  7 3         8  6.77
#>  8 4         8  5.76
#>  9 1        13  7.58
#> 10 2        13  8.74
#> # … with 34 more rows 

fish_encounters
#> # A tibble: 114 x 3
#>    fish  station  seen
#>    <fct> <fct>   <int>
#>  1 4842  Release     1
#>  2 4842  I80_1       1
#>  3 4842  Lisbon      1
#>  4 4842  Rstr        1
#>  5 4842  Base_TD     1
#>  6 4842  BCE         1
#>  7 4842  BCW         1
#>  8 4842  BCE2        1
#>  9 4842  BCW2        1
#> 10 4842  MAE         1
#> # … with 104 more rows 

fish_encounters %>% pivot_wide(names_from = station, values_from = seen)
#> # A tibble: 19 x 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2   MAE
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1     1
#>  4 4845        1     1      1     1       1    NA    NA    NA    NA    NA
#>  5 4847        1     1      1    NA      NA    NA    NA    NA    NA    NA
#>  6 4848        1     1      1     1      NA    NA    NA    NA    NA    NA
#>  7 4849        1     1     NA    NA      NA    NA    NA    NA    NA    NA
#>  8 4850        1     1     NA     1       1     1     1    NA    NA    NA
#>  9 4851        1     1     NA    NA      NA    NA    NA    NA    NA    NA
#> 10 4854        1     1     NA    NA      NA    NA    NA    NA    NA    NA
#> # … with 9 more rows, and 1 more variable: MAW <int> 

fish_encounters %>% pivot_wide(
  names_from = station, 
  values_from = seen,
  values_fill = list(seen = 0)
)
#> # A tibble: 19 x 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2   MAE
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1     1
#>  4 4845        1     1      1     1       1     0     0     0     0     0
#>  5 4847        1     1      1     0       0     0     0     0     0     0
#>  6 4848        1     1      1     1       0     0     0     0     0     0
#>  7 4849        1     1      0     0       0     0     0     0     0     0
#>  8 4850        1     1      0     1       1     1     1     0     0     0
#>  9 4851        1     1      0     0       0     0     0     0     0     0
#> 10 4854        1     1      0     0       0     0     0     0     0     0
#> # … with 9 more rows, and 1 more variable: MAW <int> 

df <- expand_grid(
    product = c("A", "B"), 
    country = c("AI", "EI"), 
    year = 2000:2014
  ) %>%
  filter((product == "A" & country == "AI") | product == "B") %>% 
  mutate(value = rnorm(nrow(.)))
df
#> # A tibble: 45 x 4
#>    product country  year   value
#>    <chr>   <chr>   <int>   <dbl>
#>  1 A       AI       2000 -0.789 
#>  2 A       AI       2001  0.0694
#>  3 A       AI       2002  1.27  
#>  4 A       AI       2003  1.21  
#>  5 A       AI       2004 -0.350 
#>  6 A       AI       2005  0.789 
#>  7 A       AI       2006 -2.12  
#>  8 A       AI       2007  0.416 
#>  9 A       AI       2008 -1.16  
#> 10 A       AI       2009 -1.45  
#> # … with 35 more rows 

df %>% pivot_wide(names_from = c(product, country), values_from = value)
#> # A tibble: 15 x 4
#>     year    A_AI   B_AI    B_EI
#>    <int>   <dbl>  <dbl>   <dbl>
#>  1  2000 -0.789  -0.438 -0.643 
#>  2  2001  0.0694 -0.519  0.390 
#>  3  2002  1.27    0.109  1.60  
#>  4  2003  1.21   -1.66   0.507 
#>  5  2004 -0.350  -0.667 -0.257 
#>  6  2005  0.789  -1.02  -0.486 
#>  7  2006 -2.12    1.81   0.0684
#>  8  2007  0.416   2.54   1.49  
#>  9  2008 -1.16    0.366  0.266 
#> 10  2009 -1.45    0.442 -0.0114
#> # … with 5 more rows 

spec <- df %>% 
  expand(product, country, .value = "value") %>% 
  unite(".name", product, country, remove = FALSE)
spec
#> # A tibble: 4 x 4
#>   .name product country .value
#>   <chr> <chr>   <chr>   <chr> 
#> 1 A_AI  A       AI      value 
#> 2 A_EI  A       EI      value 
#> 3 B_AI  B       AI      value 
#> 4 B_EI  B       EI      value

df %>% pivot_wide(spec = spec) %>% head()
#> # A tibble: 6 x 5
#>    year    A_AI  A_EI   B_AI   B_EI
#>   <int>   <dbl> <dbl>  <dbl>  <dbl>
#> 1  2000 -0.789     NA -0.438 -0.643
#> 2  2001  0.0694    NA -0.519  0.390
#> 3  2002  1.27      NA  0.109  1.60 
#> 4  2003  1.21      NA -1.66   0.507
#> 5  2004 -0.350     NA -0.667 -0.257
#> 6  2005  0.789     NA -1.02  -0.486 

us_rent_income
#> # A tibble: 104 x 5
#>    GEOID NAME       variable estimate   moe
#>    <chr> <chr>      <chr>       <dbl> <dbl>
#>  1 01    Alabama    income      24476   136
#>  2 01    Alabama    rent          747     3
#>  3 02    Alaska     income      32940   508
#>  4 02    Alaska     rent         1200    13
#>  5 04    Arizona    income      27517   148
#>  6 04    Arizona    rent          972     4
#>  7 05    Arkansas   income      23789   165
#>  8 05    Arkansas   rent          709     5
#>  9 06    California income      29454   109
#> 10 06    California rent         1358     3
#> # … with 94 more rows 

spec <- us_rent_income %>% 
  expand(variable, .value = c("estimate", "moe")) %>% 
  mutate(
    .name = paste0(variable, ifelse(.value == "moe", "_moe", ""))
  )
spec
#> # A tibble: 4 x 3
#>   variable .value   .name     
#>   <chr>    <chr>    <chr>     
#> 1 income   estimate income    
#> 2 income   moe      income_moe
#> 3 rent     estimate rent      
#> 4 rent     moe      rent_moe 

us_rent_income %>% pivot_wide(spec = spec)
#> # A tibble: 52 x 6
#>    GEOID NAME                 income income_moe  rent rent_moe
#>    <chr> <chr>                 <dbl>      <dbl> <dbl>    <dbl>
#>  1 01    Alabama               24476        136   747        3
#>  2 02    Alaska                32940        508  1200       13
#>  3 04    Arizona               27517        148   972        4
#>  4 05    Arkansas              23789        165   709        5
#>  5 06    California            29454        109  1358        3
#>  6 08    Colorado              32401        109  1125        5
#>  7 09    Connecticut           35326        195  1123        5
#>  8 10    Delaware              31560        247  1076       10
#>  9 11    District of Columbia  43198        681  1424       17
#> 10 12    Florida               25952         70  1077        3
#> # … with 42 more rows 

world_bank_pop
#> # A tibble: 1,056 x 20
#>    country indicator `2000` `2001` `2002` `2003`  `2004`  `2005`   `2006`
#>    <chr>   <chr>      <dbl>  <dbl>  <dbl>  <dbl>   <dbl>   <dbl>    <dbl>
#>  1 ABW     SP.URB.T… 4.24e4 4.30e4 4.37e4 4.42e4 4.47e+4 4.49e+4  4.49e+4
#>  2 ABW     SP.URB.G… 1.18e0 1.41e0 1.43e0 1.31e0 9.51e-1 4.91e-1 -1.78e-2
#>  3 ABW     SP.POP.T… 9.09e4 9.29e4 9.50e4 9.70e4 9.87e+4 1.00e+5  1.01e+5
#>  4 ABW     SP.POP.G… 2.06e0 2.23e0 2.23e0 2.11e0 1.76e+0 1.30e+0  7.98e-1
#>  5 AFG     SP.URB.T… 4.44e6 4.65e6 4.89e6 5.16e6 5.43e+6 5.69e+6  5.93e+6
#>  6 AFG     SP.URB.G… 3.91e0 4.66e0 5.13e0 5.23e0 5.12e+0 4.77e+0  4.12e+0
#>  7 AFG     SP.POP.T… 2.01e7 2.10e7 2.20e7 2.31e7 2.41e+7 2.51e+7  2.59e+7
#>  8 AFG     SP.POP.G… 3.49e0 4.25e0 4.72e0 4.82e0 4.47e+0 3.87e+0  3.23e+0
#>  9 AGO     SP.URB.T… 8.23e6 8.71e6 9.22e6 9.77e6 1.03e+7 1.09e+7  1.15e+7
#> 10 AGO     SP.URB.G… 5.44e0 5.59e0 5.70e0 5.76e0 5.75e+0 5.69e+0  4.92e+0
#> # … with 1,046 more rows, and 11 more variables: `2007` <dbl>,
#> #   `2008` <dbl>, `2009` <dbl>, `2010` <dbl>, `2011` <dbl>, `2012` <dbl>,
#> #   `2013` <dbl>, `2014` <dbl>, `2015` <dbl>, `2016` <dbl>, `2017` <dbl> 

pop2 <- world_bank_pop %>% 
  pivot_long(`2000`:`2017`, names_to = "year")
pop2
#> # A tibble: 19,008 x 4
#>    country indicator   year  value
#>    <chr>   <chr>       <chr> <dbl>
#>  1 ABW     SP.URB.TOTL 2000  42444
#>  2 ABW     SP.URB.TOTL 2001  43048
#>  3 ABW     SP.URB.TOTL 2002  43670
#>  4 ABW     SP.URB.TOTL 2003  44246
#>  5 ABW     SP.URB.TOTL 2004  44669
#>  6 ABW     SP.URB.TOTL 2005  44889
#>  7 ABW     SP.URB.TOTL 2006  44881
#>  8 ABW     SP.URB.TOTL 2007  44686
#>  9 ABW     SP.URB.TOTL 2008  44375
#> 10 ABW     SP.URB.TOTL 2009  44052
#> # … with 18,998 more rows 

pop2 %>% count(indicator)
#> # A tibble: 4 x 2
#>   indicator       n
#>   <chr>       <int>
#> 1 SP.POP.GROW  4752
#> 2 SP.POP.TOTL  4752
#> 3 SP.URB.GROW  4752
#> 4 SP.URB.TOTL  4752 

pop3 <- pop2 %>% 
  separate(indicator, c(NA, "area", "variable"))
pop3
#> # A tibble: 19,008 x 5
#>    country area  variable year  value
#>    <chr>   <chr> <chr>    <chr> <dbl>
#>  1 ABW     URB   TOTL     2000  42444
#>  2 ABW     URB   TOTL     2001  43048
#>  3 ABW     URB   TOTL     2002  43670
#>  4 ABW     URB   TOTL     2003  44246
#>  5 ABW     URB   TOTL     2004  44669
#>  6 ABW     URB   TOTL     2005  44889
#>  7 ABW     URB   TOTL     2006  44881
#>  8 ABW     URB   TOTL     2007  44686
#>  9 ABW     URB   TOTL     2008  44375
#> 10 ABW     URB   TOTL     2009  44052
#> # … with 18,998 more rows 

pop3 %>% 
  pivot_wide(names_from = variable, values_from = value)
#> # A tibble: 9,504 x 5
#>    country area  year   TOTL    GROW
#>    <chr>   <chr> <chr> <dbl>   <dbl>
#>  1 ABW     URB   2000  42444  1.18  
#>  2 ABW     URB   2001  43048  1.41  
#>  3 ABW     URB   2002  43670  1.43  
#>  4 ABW     URB   2003  44246  1.31  
#>  5 ABW     URB   2004  44669  0.951 
#>  6 ABW     URB   2005  44889  0.491 
#>  7 ABW     URB   2006  44881 -0.0178
#>  8 ABW     URB   2007  44686 -0.435 
#>  9 ABW     URB   2008  44375 -0.698 
#> 10 ABW     URB   2009  44052 -0.731 
#> # … with 9,494 more rows 

df <- tibble::tribble(
  ~id, ~choice1, ~choice2, ~choice3,
  1, "A", "B", "C",
  2, "B", "C",  NA,
  3, "D",  NA,  NA,
  4, "B", "D",  NA
)

df %>% 
  pivot_long(-id, na.rm = TRUE) %>% 
  dplyr::count(id, value) %>% 
  pivot_wide(
    names_from = value, 
    values_from = n, 
    values_fill = list(n = 0)
  )
#> # A tibble: 4 x 5
#>      id     A     B     C     D
#>   <dbl> <int> <int> <int> <int>
#> 1     1     1     1     1     0
#> 2     2     0     1     1     0
#> 3     3     0     0     0     1
#> 4     4     0     1     0     1 

contacts <- tribble(
  ~field, ~value,
  "name", "Jiena McLellan",
  "company", "Toyota", 
  "name", "John Smith", 
  "company", "google", 
  "email", "john@google.com",
  "name", "Huxley Ratcliffe"
) 

contacts <- contacts %>% 
  mutate(
    person_id = cumsum(field == "name")
  )
contacts
#> # A tibble: 6 x 3
#>   field   value            person_id
#>   <chr>   <chr>                <int>
#> 1 name    Jiena McLellan           1
#> 2 company Toyota                   1
#> 3 name    John Smith               2
#> 4 company google                   2
#> 5 email   john@google.com          2
#> 6 name    Huxley Ratcliffe         3 

contacts %>% 
  pivot_wide(names_from = field, values_from = value)
#> # A tibble: 3 x 4
#>   person_id name             company email          
#>       <int> <chr>            <chr>   <chr>          
#> 1         1 Jiena McLellan   Toyota  <NA>           
#> 2         2 John Smith       google  john@google.com
#> 3         3 Huxley Ratcliffe <NA>    <NA> 

Fonte: https://tidyr.tidyverse.org/dev/articles/pivot.html