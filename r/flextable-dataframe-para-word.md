# ipak function: install and load multiple R packages.
# Check to see if packages are installed.
# Install them if they are not, then load them into the R session.
# Forked from: https://gist.github.com/stevenworthington/3178163

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
  {
    install.packages(new.pkg, dependencies = TRUE)
  }
  suppressPackageStartupMessages(sapply(pkg, require, character.only = TRUE))
}

ipak(c("officer", "flextable", "tidyverse"))

data <- iris[1:30, ]

ft <- flextable(data = data) %>%
  flextable::theme_vanilla() %>%
  autofit()

read_docx() %>%
  body_add_flextable(ft) %>%
  print(target = "table.docx")
