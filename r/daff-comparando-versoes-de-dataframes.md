# on Ubuntu 16.04 LTS
# sudo apt install libv8-3.14-dev

devtools::install_github("edwindj/daff")
library(daff)

y <- iris[1:3,]
x <- y

(x <- head(x,2)) # remove a row
(x[1,1] <- 10) # change a value
(x$hello <- "world")  # add a column
(x$Species <- NULL) # remove a column

patch <- diff_data(y, x)

# write a patch to disk
write_diff(patch, "patch.csv")

render_diff(patch)

daff::diff_data(x, y)

Um pouco diferente da ferramenta [diff](https://www.gnu.org/software/diffutils/) 
