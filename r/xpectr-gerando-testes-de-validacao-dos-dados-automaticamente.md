```r
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("devtools")) install.packages("devtools")
if (!require("testthat")) install.packages("testthat")
if (!require("xpectr")) install.packages("xpectr")

group_and_average <- function(data, by, var) {
  
  data %>% 
    group_by({{ by }}) %>% 
    summarise(average = mean({{ var }}))
  
}

group_and_average(data = mtcars, by = carb, var = mpg)

# Gerando o teste

xpectr::gxs_selection("group_and_average(data = mtcars, by = carb, var = mpg)")

## Testing 'group_and_average(data = mtcars, by = carb, va...'              ####
## Initially generated by xpectr
xpectr::set_test_seed(42)
# Assigning output
output_14577 <- group_and_average(data = mtcars, by = carb, var = mpg)
# Testing class
expect_equal(
  class(output_14577),
  c("tbl_df", "tbl", "data.frame"),
  fixed = TRUE)
# Testing column values
expect_equal(
  output_14577[["carb"]],
  c(1, 2, 3, 4, 6, 8),
  tolerance = 1e-4)
expect_equal(
  output_14577[["average"]],
  c(25.34286, 22.4, 16.3, 15.79, 19.7, 15),
  tolerance = 1e-4)
# Testing column names
expect_equal(
  names(output_14577),
  c("carb", "average"),
  fixed = TRUE)
# Testing column classes
expect_equal(
  xpectr::element_classes(output_14577),
  c("numeric", "numeric"),
  fixed = TRUE)
# Testing column types
expect_equal(
  xpectr::element_types(output_14577),
  c("double", "double"),
  fixed = TRUE)
# Testing dimensions
expect_equal(
  dim(output_14577),
  c(6L, 2L))
# Testing group keys
expect_equal(
  colnames(dplyr::group_keys(output_14577)),
  character(0),
  fixed = TRUE)
## Finished testing 'group_and_average(data = mtcars, by = carb, va...'     ####
```


