<!-- https://rdrr.io/cran/ggthemes/man/colorblind.html -->

library(ggplot2)
library(ggthemes)
library(scales)

show_col(colorblind_pal()(8))

p <- ggplot(mtcars) + geom_point(aes(
  x = wt,
  y = mpg,
  colour = factor(gear)
)) + facet_wrap( ~ am)
p + theme_light() + scale_colour_colorblind()
