you:
data <- read_csv("my_data.csv")
data2 <- read_csv("my_data2.csv")
data3 <- bind_rows(data, data2)

me, an intellectual: 
data <- 
  here::here() %>%
   dir_ls(regexp = "\\.csv$") %>% 
    map_dfr(read_csv, .id = "source")

Fonte: https://mobile.twitter.com/W_R_Chase/status/1104588157792731138

