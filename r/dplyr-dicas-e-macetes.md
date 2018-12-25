
# `dplyr`: dicas e macetes

``` r
if (!require("tidyverse")) install.packages("tidyverse")
```

    ## Loading required package: tidyverse

    ## ── Attaching packages ───────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.8
    ## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
    ## ✔ readr   1.3.0     ✔ forcats 0.3.0

    ## ── Conflicts ──────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

## Selecionar várias colunas

``` r
cols <- c("mpg", "cyl", "gear")

mtcars %>%
  select(!!cols)
```

    ##                      mpg cyl gear
    ## Mazda RX4           21.0   6    4
    ## Mazda RX4 Wag       21.0   6    4
    ## Datsun 710          22.8   4    4
    ## Hornet 4 Drive      21.4   6    3
    ## Hornet Sportabout   18.7   8    3
    ## Valiant             18.1   6    3
    ## Duster 360          14.3   8    3
    ## Merc 240D           24.4   4    4
    ## Merc 230            22.8   4    4
    ## Merc 280            19.2   6    4
    ## Merc 280C           17.8   6    4
    ## Merc 450SE          16.4   8    3
    ## Merc 450SL          17.3   8    3
    ## Merc 450SLC         15.2   8    3
    ## Cadillac Fleetwood  10.4   8    3
    ## Lincoln Continental 10.4   8    3
    ## Chrysler Imperial   14.7   8    3
    ## Fiat 128            32.4   4    4
    ## Honda Civic         30.4   4    4
    ## Toyota Corolla      33.9   4    4
    ## Toyota Corona       21.5   4    3
    ## Dodge Challenger    15.5   8    3
    ## AMC Javelin         15.2   8    3
    ## Camaro Z28          13.3   8    3
    ## Pontiac Firebird    19.2   8    3
    ## Fiat X1-9           27.3   4    4
    ## Porsche 914-2       26.0   4    5
    ## Lotus Europa        30.4   4    5
    ## Ford Pantera L      15.8   8    5
    ## Ferrari Dino        19.7   6    5
    ## Maserati Bora       15.0   8    5
    ## Volvo 142E          21.4   4    4

## Selecionar colunas via regex

``` r
iris %>%
  select(matches("S.+th"))
```

    ##     Sepal.Length Sepal.Width
    ## 1            5.1         3.5
    ## 2            4.9         3.0
    ## 3            4.7         3.2
    ## 4            4.6         3.1
    ## 5            5.0         3.6
    ## 6            5.4         3.9
    ## 7            4.6         3.4
    ## 8            5.0         3.4
    ## 9            4.4         2.9
    ## 10           4.9         3.1
    ## 11           5.4         3.7
    ## 12           4.8         3.4
    ## 13           4.8         3.0
    ## 14           4.3         3.0
    ## 15           5.8         4.0
    ## 16           5.7         4.4
    ## 17           5.4         3.9
    ## 18           5.1         3.5
    ## 19           5.7         3.8
    ## 20           5.1         3.8
    ## 21           5.4         3.4
    ## 22           5.1         3.7
    ## 23           4.6         3.6
    ## 24           5.1         3.3
    ## 25           4.8         3.4
    ## 26           5.0         3.0
    ## 27           5.0         3.4
    ## 28           5.2         3.5
    ## 29           5.2         3.4
    ## 30           4.7         3.2
    ## 31           4.8         3.1
    ## 32           5.4         3.4
    ## 33           5.2         4.1
    ## 34           5.5         4.2
    ## 35           4.9         3.1
    ## 36           5.0         3.2
    ## 37           5.5         3.5
    ## 38           4.9         3.6
    ## 39           4.4         3.0
    ## 40           5.1         3.4
    ## 41           5.0         3.5
    ## 42           4.5         2.3
    ## 43           4.4         3.2
    ## 44           5.0         3.5
    ## 45           5.1         3.8
    ## 46           4.8         3.0
    ## 47           5.1         3.8
    ## 48           4.6         3.2
    ## 49           5.3         3.7
    ## 50           5.0         3.3
    ## 51           7.0         3.2
    ## 52           6.4         3.2
    ## 53           6.9         3.1
    ## 54           5.5         2.3
    ## 55           6.5         2.8
    ## 56           5.7         2.8
    ## 57           6.3         3.3
    ## 58           4.9         2.4
    ## 59           6.6         2.9
    ## 60           5.2         2.7
    ## 61           5.0         2.0
    ## 62           5.9         3.0
    ## 63           6.0         2.2
    ## 64           6.1         2.9
    ## 65           5.6         2.9
    ## 66           6.7         3.1
    ## 67           5.6         3.0
    ## 68           5.8         2.7
    ## 69           6.2         2.2
    ## 70           5.6         2.5
    ## 71           5.9         3.2
    ## 72           6.1         2.8
    ## 73           6.3         2.5
    ## 74           6.1         2.8
    ## 75           6.4         2.9
    ## 76           6.6         3.0
    ## 77           6.8         2.8
    ## 78           6.7         3.0
    ## 79           6.0         2.9
    ## 80           5.7         2.6
    ## 81           5.5         2.4
    ## 82           5.5         2.4
    ## 83           5.8         2.7
    ## 84           6.0         2.7
    ## 85           5.4         3.0
    ## 86           6.0         3.4
    ## 87           6.7         3.1
    ## 88           6.3         2.3
    ## 89           5.6         3.0
    ## 90           5.5         2.5
    ## 91           5.5         2.6
    ## 92           6.1         3.0
    ## 93           5.8         2.6
    ## 94           5.0         2.3
    ## 95           5.6         2.7
    ## 96           5.7         3.0
    ## 97           5.7         2.9
    ## 98           6.2         2.9
    ## 99           5.1         2.5
    ## 100          5.7         2.8
    ## 101          6.3         3.3
    ## 102          5.8         2.7
    ## 103          7.1         3.0
    ## 104          6.3         2.9
    ## 105          6.5         3.0
    ## 106          7.6         3.0
    ## 107          4.9         2.5
    ## 108          7.3         2.9
    ## 109          6.7         2.5
    ## 110          7.2         3.6
    ## 111          6.5         3.2
    ## 112          6.4         2.7
    ## 113          6.8         3.0
    ## 114          5.7         2.5
    ## 115          5.8         2.8
    ## 116          6.4         3.2
    ## 117          6.5         3.0
    ## 118          7.7         3.8
    ## 119          7.7         2.6
    ## 120          6.0         2.2
    ## 121          6.9         3.2
    ## 122          5.6         2.8
    ## 123          7.7         2.8
    ## 124          6.3         2.7
    ## 125          6.7         3.3
    ## 126          7.2         3.2
    ## 127          6.2         2.8
    ## 128          6.1         3.0
    ## 129          6.4         2.8
    ## 130          7.2         3.0
    ## 131          7.4         2.8
    ## 132          7.9         3.8
    ## 133          6.4         2.8
    ## 134          6.3         2.8
    ## 135          6.1         2.6
    ## 136          7.7         3.0
    ## 137          6.3         3.4
    ## 138          6.4         3.1
    ## 139          6.0         3.0
    ## 140          6.9         3.1
    ## 141          6.7         3.1
    ## 142          6.9         3.1
    ## 143          5.8         2.7
    ## 144          6.8         3.2
    ## 145          6.7         3.3
    ## 146          6.7         3.0
    ## 147          6.3         2.5
    ## 148          6.5         3.0
    ## 149          6.2         3.4
    ## 150          5.9         3.0

Quando apropriado, você também pode usar: `starts_with()`, `contains()`,
e `ends_with`.

## Reordenando colunas

Selecione as colunas que você quer e chame as remanescentes com o
`everything`.

``` r
mtcars %>%
  select(carb, everything())
```

    ##                     carb  mpg cyl  disp  hp drat    wt  qsec vs am gear
    ## Mazda RX4              4 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4
    ## Mazda RX4 Wag          4 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4
    ## Datsun 710             1 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4
    ## Hornet 4 Drive         1 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3
    ## Hornet Sportabout      2 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3
    ## Valiant                1 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3
    ## Duster 360             4 14.3   8 360.0 245 3.21 3.570 15.84  0  0    3
    ## Merc 240D              2 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4
    ## Merc 230               2 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4
    ## Merc 280               4 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4
    ## Merc 280C              4 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4
    ## Merc 450SE             3 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3
    ## Merc 450SL             3 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3
    ## Merc 450SLC            3 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3
    ## Cadillac Fleetwood     4 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3
    ## Lincoln Continental    4 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3
    ## Chrysler Imperial      4 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3
    ## Fiat 128               1 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4
    ## Honda Civic            2 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4
    ## Toyota Corolla         1 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4
    ## Toyota Corona          1 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3
    ## Dodge Challenger       2 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3
    ## AMC Javelin            2 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3
    ## Camaro Z28             4 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3
    ## Pontiac Firebird       2 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3
    ## Fiat X1-9              1 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4
    ## Porsche 914-2          2 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5
    ## Lotus Europa           2 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5
    ## Ford Pantera L         4 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5
    ## Ferrari Dino           6 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5
    ## Maserati Bora          8 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5
    ## Volvo 142E             2 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4

## Renomeando várias colunas

``` r
iris %>%
  rename_all(tolower) %>%
  rename_all(~str_replace_all(
    string = .,
    pattern = "\\.",
    replacement = "_")
    )
```

    ##     sepal_length sepal_width petal_length petal_width    species
    ## 1            5.1         3.5          1.4         0.2     setosa
    ## 2            4.9         3.0          1.4         0.2     setosa
    ## 3            4.7         3.2          1.3         0.2     setosa
    ## 4            4.6         3.1          1.5         0.2     setosa
    ## 5            5.0         3.6          1.4         0.2     setosa
    ## 6            5.4         3.9          1.7         0.4     setosa
    ## 7            4.6         3.4          1.4         0.3     setosa
    ## 8            5.0         3.4          1.5         0.2     setosa
    ## 9            4.4         2.9          1.4         0.2     setosa
    ## 10           4.9         3.1          1.5         0.1     setosa
    ## 11           5.4         3.7          1.5         0.2     setosa
    ## 12           4.8         3.4          1.6         0.2     setosa
    ## 13           4.8         3.0          1.4         0.1     setosa
    ## 14           4.3         3.0          1.1         0.1     setosa
    ## 15           5.8         4.0          1.2         0.2     setosa
    ## 16           5.7         4.4          1.5         0.4     setosa
    ## 17           5.4         3.9          1.3         0.4     setosa
    ## 18           5.1         3.5          1.4         0.3     setosa
    ## 19           5.7         3.8          1.7         0.3     setosa
    ## 20           5.1         3.8          1.5         0.3     setosa
    ## 21           5.4         3.4          1.7         0.2     setosa
    ## 22           5.1         3.7          1.5         0.4     setosa
    ## 23           4.6         3.6          1.0         0.2     setosa
    ## 24           5.1         3.3          1.7         0.5     setosa
    ## 25           4.8         3.4          1.9         0.2     setosa
    ## 26           5.0         3.0          1.6         0.2     setosa
    ## 27           5.0         3.4          1.6         0.4     setosa
    ## 28           5.2         3.5          1.5         0.2     setosa
    ## 29           5.2         3.4          1.4         0.2     setosa
    ## 30           4.7         3.2          1.6         0.2     setosa
    ## 31           4.8         3.1          1.6         0.2     setosa
    ## 32           5.4         3.4          1.5         0.4     setosa
    ## 33           5.2         4.1          1.5         0.1     setosa
    ## 34           5.5         4.2          1.4         0.2     setosa
    ## 35           4.9         3.1          1.5         0.2     setosa
    ## 36           5.0         3.2          1.2         0.2     setosa
    ## 37           5.5         3.5          1.3         0.2     setosa
    ## 38           4.9         3.6          1.4         0.1     setosa
    ## 39           4.4         3.0          1.3         0.2     setosa
    ## 40           5.1         3.4          1.5         0.2     setosa
    ## 41           5.0         3.5          1.3         0.3     setosa
    ## 42           4.5         2.3          1.3         0.3     setosa
    ## 43           4.4         3.2          1.3         0.2     setosa
    ## 44           5.0         3.5          1.6         0.6     setosa
    ## 45           5.1         3.8          1.9         0.4     setosa
    ## 46           4.8         3.0          1.4         0.3     setosa
    ## 47           5.1         3.8          1.6         0.2     setosa
    ## 48           4.6         3.2          1.4         0.2     setosa
    ## 49           5.3         3.7          1.5         0.2     setosa
    ## 50           5.0         3.3          1.4         0.2     setosa
    ## 51           7.0         3.2          4.7         1.4 versicolor
    ## 52           6.4         3.2          4.5         1.5 versicolor
    ## 53           6.9         3.1          4.9         1.5 versicolor
    ## 54           5.5         2.3          4.0         1.3 versicolor
    ## 55           6.5         2.8          4.6         1.5 versicolor
    ## 56           5.7         2.8          4.5         1.3 versicolor
    ## 57           6.3         3.3          4.7         1.6 versicolor
    ## 58           4.9         2.4          3.3         1.0 versicolor
    ## 59           6.6         2.9          4.6         1.3 versicolor
    ## 60           5.2         2.7          3.9         1.4 versicolor
    ## 61           5.0         2.0          3.5         1.0 versicolor
    ## 62           5.9         3.0          4.2         1.5 versicolor
    ## 63           6.0         2.2          4.0         1.0 versicolor
    ## 64           6.1         2.9          4.7         1.4 versicolor
    ## 65           5.6         2.9          3.6         1.3 versicolor
    ## 66           6.7         3.1          4.4         1.4 versicolor
    ## 67           5.6         3.0          4.5         1.5 versicolor
    ## 68           5.8         2.7          4.1         1.0 versicolor
    ## 69           6.2         2.2          4.5         1.5 versicolor
    ## 70           5.6         2.5          3.9         1.1 versicolor
    ## 71           5.9         3.2          4.8         1.8 versicolor
    ## 72           6.1         2.8          4.0         1.3 versicolor
    ## 73           6.3         2.5          4.9         1.5 versicolor
    ## 74           6.1         2.8          4.7         1.2 versicolor
    ## 75           6.4         2.9          4.3         1.3 versicolor
    ## 76           6.6         3.0          4.4         1.4 versicolor
    ## 77           6.8         2.8          4.8         1.4 versicolor
    ## 78           6.7         3.0          5.0         1.7 versicolor
    ## 79           6.0         2.9          4.5         1.5 versicolor
    ## 80           5.7         2.6          3.5         1.0 versicolor
    ## 81           5.5         2.4          3.8         1.1 versicolor
    ## 82           5.5         2.4          3.7         1.0 versicolor
    ## 83           5.8         2.7          3.9         1.2 versicolor
    ## 84           6.0         2.7          5.1         1.6 versicolor
    ## 85           5.4         3.0          4.5         1.5 versicolor
    ## 86           6.0         3.4          4.5         1.6 versicolor
    ## 87           6.7         3.1          4.7         1.5 versicolor
    ## 88           6.3         2.3          4.4         1.3 versicolor
    ## 89           5.6         3.0          4.1         1.3 versicolor
    ## 90           5.5         2.5          4.0         1.3 versicolor
    ## 91           5.5         2.6          4.4         1.2 versicolor
    ## 92           6.1         3.0          4.6         1.4 versicolor
    ## 93           5.8         2.6          4.0         1.2 versicolor
    ## 94           5.0         2.3          3.3         1.0 versicolor
    ## 95           5.6         2.7          4.2         1.3 versicolor
    ## 96           5.7         3.0          4.2         1.2 versicolor
    ## 97           5.7         2.9          4.2         1.3 versicolor
    ## 98           6.2         2.9          4.3         1.3 versicolor
    ## 99           5.1         2.5          3.0         1.1 versicolor
    ## 100          5.7         2.8          4.1         1.3 versicolor
    ## 101          6.3         3.3          6.0         2.5  virginica
    ## 102          5.8         2.7          5.1         1.9  virginica
    ## 103          7.1         3.0          5.9         2.1  virginica
    ## 104          6.3         2.9          5.6         1.8  virginica
    ## 105          6.5         3.0          5.8         2.2  virginica
    ## 106          7.6         3.0          6.6         2.1  virginica
    ## 107          4.9         2.5          4.5         1.7  virginica
    ## 108          7.3         2.9          6.3         1.8  virginica
    ## 109          6.7         2.5          5.8         1.8  virginica
    ## 110          7.2         3.6          6.1         2.5  virginica
    ## 111          6.5         3.2          5.1         2.0  virginica
    ## 112          6.4         2.7          5.3         1.9  virginica
    ## 113          6.8         3.0          5.5         2.1  virginica
    ## 114          5.7         2.5          5.0         2.0  virginica
    ## 115          5.8         2.8          5.1         2.4  virginica
    ## 116          6.4         3.2          5.3         2.3  virginica
    ## 117          6.5         3.0          5.5         1.8  virginica
    ## 118          7.7         3.8          6.7         2.2  virginica
    ## 119          7.7         2.6          6.9         2.3  virginica
    ## 120          6.0         2.2          5.0         1.5  virginica
    ## 121          6.9         3.2          5.7         2.3  virginica
    ## 122          5.6         2.8          4.9         2.0  virginica
    ## 123          7.7         2.8          6.7         2.0  virginica
    ## 124          6.3         2.7          4.9         1.8  virginica
    ## 125          6.7         3.3          5.7         2.1  virginica
    ## 126          7.2         3.2          6.0         1.8  virginica
    ## 127          6.2         2.8          4.8         1.8  virginica
    ## 128          6.1         3.0          4.9         1.8  virginica
    ## 129          6.4         2.8          5.6         2.1  virginica
    ## 130          7.2         3.0          5.8         1.6  virginica
    ## 131          7.4         2.8          6.1         1.9  virginica
    ## 132          7.9         3.8          6.4         2.0  virginica
    ## 133          6.4         2.8          5.6         2.2  virginica
    ## 134          6.3         2.8          5.1         1.5  virginica
    ## 135          6.1         2.6          5.6         1.4  virginica
    ## 136          7.7         3.0          6.1         2.3  virginica
    ## 137          6.3         3.4          5.6         2.4  virginica
    ## 138          6.4         3.1          5.5         1.8  virginica
    ## 139          6.0         3.0          4.8         1.8  virginica
    ## 140          6.9         3.1          5.4         2.1  virginica
    ## 141          6.7         3.1          5.6         2.4  virginica
    ## 142          6.9         3.1          5.1         2.3  virginica
    ## 143          5.8         2.7          5.1         1.9  virginica
    ## 144          6.8         3.2          5.9         2.3  virginica
    ## 145          6.7         3.3          5.7         2.5  virginica
    ## 146          6.7         3.0          5.2         2.3  virginica
    ## 147          6.3         2.5          5.0         1.9  virginica
    ## 148          6.5         3.0          5.2         2.0  virginica
    ## 149          6.2         3.4          5.4         2.3  virginica
    ## 150          5.9         3.0          5.1         1.8  virginica

## Limpando conteúdo das observações

`select` e `rename` mudam apenas os nomes das colunas. Para mudar as
observações (valores das células dos nossos dados) precisamos do
`mutate`.

``` r
storms %>%
  select(name, year, status) %>%
  mutate_all(tolower) %>%
  mutate_all(~str_replace_all(
    string = .,
    pattern = " ",
    replacement = "_"
  )
  )
```

    ## # A tibble: 10,010 x 3
    ##    name  year  status
    ##    <chr> <chr> <chr>
    ##  1 amy   1975  tropical_depression
    ##  2 amy   1975  tropical_depression
    ##  3 amy   1975  tropical_depression
    ##  4 amy   1975  tropical_depression
    ##  5 amy   1975  tropical_depression
    ##  6 amy   1975  tropical_depression
    ##  7 amy   1975  tropical_depression
    ##  8 amy   1975  tropical_depression
    ##  9 amy   1975  tropical_storm
    ## 10 amy   1975  tropical_storm
    ## # ... with 10,000 more rows

## Encontrando valores máximos sem reordenar observações

``` r
# versão verborrática
mtcars %>%
  arrange(hp) %>%
  tail(5)
```

    ##     mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## 28 14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
    ## 29 14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
    ## 30 13.3   8  350 245 3.73 3.840 15.41  0  0    3    4
    ## 31 15.8   8  351 264 4.22 3.170 14.50  0  1    5    4
    ## 32 15.0   8  301 335 3.54 3.570 14.60  0  1    5    8

``` r
# versão enxuta
mtcars %>%
  top_n(5, hp)
```

    ##    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## 1 14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
    ## 2 14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
    ## 3 13.3   8  350 245 3.73 3.840 15.41  0  0    3    4
    ## 4 15.8   8  351 264 4.22 3.170 14.50  0  1    5    4
    ## 5 15.0   8  301 335 3.54 3.570 14.60  0  1    5    8

## Manipulação entre observações entre colunas

``` r
iris %>%
  select(contains("Length")) %>%
  rowwise() %>%
  mutate(media_dos_comp = mean(c(Petal.Length, Sepal.Length)))
```

    ## Source: local data frame [150 x 3]
    ## Groups: <by row>
    ##
    ## # A tibble: 150 x 3
    ##    Sepal.Length Petal.Length media_dos_comp
    ##           <dbl>        <dbl>          <dbl>
    ##  1          5.1          1.4           3.25
    ##  2          4.9          1.4           3.15
    ##  3          4.7          1.3           3
    ##  4          4.6          1.5           3.05
    ##  5          5            1.4           3.2
    ##  6          5.4          1.7           3.55
    ##  7          4.6          1.4           3
    ##  8          5            1.5           3.25
    ##  9          4.4          1.4           2.9
    ## 10          4.9          1.5           3.2
    ## # ... with 140 more rows
