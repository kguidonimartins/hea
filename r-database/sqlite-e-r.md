# SQLite e R

```r
install.packages(c("dbplyr", "RSQLite")) 

dir.create("data", showWarnings = FALSE)
download.file(url = "https://ndownloader.figshare.com/files/2292171",
              destfile = "data/portal_mammals.sqlite", mode = "wb") 

library(dplyr)
library(dbplyr) 

mammals <- DBI::dbConnect(RSQLite::SQLite(), "data/portal_mammals.sqlite") 

src_dbi(mammals) 

tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys")) 

surveys <- tbl(mammals, "surveys")
surveys %>%
  select(year, species_id, plot_id) 

head(surveys, n = 10) 

nrow(surveys) 

show_query(head(surveys, n = 10)) 

surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) 

data_subset <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

data_subset %>%
  select(-sex) 

data_subset <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>%
  collect() 

plots <- tbl(mammals, "plots")
plots 

surveys 

plots %>%
  filter(plot_id == 1) %>%
  inner_join(surveys) %>%
  collect() 

## with dplyr syntax
species <- tbl(mammals, "species")

left_join(surveys, species) %>%
  filter(taxa == "Rodent") %>%
  group_by(taxa, year) %>%
  tally %>%
  collect() 

## with SQL syntax
query <- paste("
SELECT a.year, b.taxa,count(*) as count
FROM surveys a
JOIN species b
ON a.species_id = b.species_id
AND b.taxa = 'Rodent'
GROUP BY a.year, b.taxa",
               sep = "" )

tbl(mammals, sql(query)) 

species <- tbl(mammals, "species")
genus_counts <- left_join(surveys, plots) %>%
  left_join(species) %>%
  filter(taxa == "Rodent") %>%
  group_by(plot_type, genus) %>%
  tally %>%
  collect() 

species <- tbl(mammals, "species")
unique_genera <- left_join(surveys, plots) %>%
  left_join(species) %>%
  group_by(plot_type) %>%
  summarize(
    n_genera = n_distinct(genus)
  ) %>%
  collect() 

download.file("https://ndownloader.figshare.com/files/3299483",
              "data/species.csv")
download.file("https://ndownloader.figshare.com/files/10717177",
              "data/surveys.csv")
download.file("https://ndownloader.figshare.com/files/3299474",
              "data/plots.csv")
library(tidyverse)
species <- read_csv("data/species.csv") 

surveys <- read_csv("data/surveys.csv") 

plots <- read_csv("data/plots.csv") 

my_db_file <- "data_output/portal-database-output.sqlite"
my_db <- src_sqlite(my_db_file, create = TRUE) 

my_db 

copy_to(my_db, surveys)
copy_to(my_db, plots)
my_db 
```

Fonte: https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html
