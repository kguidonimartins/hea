# https://www.rcharlie.com/post/fitter-happier/
  
# https://developer.spotify.com/documentation/web-api/reference/tracks/get-audio-features/

# ipak function: install and load multiple R packages.
# Check to see if packages are installed. 
# Install them if they are not, then load them into the R session.
# Forked from: https://gist.github.com/stevenworthington/3178163
ipak <- function(pkg) {
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)){
    install.packages(new.pkg, dependencies = TRUE)
  }
  suppressPackageStartupMessages(sapply(pkg, require, character.only = TRUE))
}

ipak(c("tidyverse", "spotifyr"))

Sys.setenv(SPOTIFY_CLIENT_ID = 'xxxxxx')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'xxxxxx')

spotify_df <- get_artist_audio_features('radiohead')

str(spotify_df)

## Selecionando os atributos
track_df <- spotify_df %>%
  select(track_name, valence, duration_ms, album_name, external_urls.spotify)

## Organizando a lista com as 13 músicas mais animadas da banda
selected <- track_df %>% 
  select(valence, track_name, external_urls.spotify) %>%
  arrange(-valence) %>%
  slice(1:15)

## Plotando o gráfico de valência com o ggplot

selected %>%
  ggplot(aes(x = reorder(track_name, valence), y = valence)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "As 15 músicas mais animadas do Radiohead", 
    x = "Título das músicas", 
    y = "Valência - Escala de animação",
    subtitle = "Valência é uma medida de 0.0 a 1.0 que descreve a positividade musical transmitida por uma faixa.\nFaixas com alta valência soam mais positivas e as faixas com baixa valência soam mais negativas."
    ) +
  theme_light()

selected %>% 
  select(external_urls.spotify)

library(magrittr)

led <- spotifyr::get_artist_audio_features("Led Zeppelin")

led %<>% 
  arrange(track_number) %>% 
  arrange(album_release_date) %>% 
  arrange(-valence) 

led %>% 
  {mutate(track_name = )}

led$track_name <-  stringr::str_replace_all(string = led$track_name, pattern = "\\s\\-\\s[a-zA-Z0-9].*?.*$", replacement = "")

stringr::str_replace_all(string = .$track_name, pattern = "\\s\\-\\s[a-zA-Z0-9].*?.*$", replacement = "")

