```r
df_clean <-  df %>%
    names %>%
    stringr::str_trim() %>%                         # remove espaços
    stringr::str_to_lower() %>%                     # to lower case
    abjutils::rm_accent() %>%                       # remove acentos
    stringr::str_replace_all("[/' '.()]", "_") %>%  # remove caracteres especiais por "_"
    stringr::str_replace_all("_+", "_") %>%         # substitui um ou mais subtraços juntos por apenas um subtraço
    stringr::str_replace("_$", "")                  # remove os subtraços no final dos nomes
```
# Ou

```r
df_clean %>%
    names %>%
    janitor::clean_names()
```
