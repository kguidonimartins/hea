```{r, message=FALSE, results='hide', echo=FALSE}
if (!require("reticulate")) 
  install.packages("reticulate")
if (!require("tidyverse")) 
  install.packages("tidyverse")
if (!require("glue")) 
  install.packages("glue")
if (!require("remotes")) 
  install.packages("remotes")
if (!require("rminiconda")) 
  install_github("hafen/rminiconda")

packageVersion("reticulate")

# definir env_name
env_name <- "env_rminiconda"

# definir lista de bibliotecas
pkgs_py <- c(
  "pandas",
  "numpy",
  "pandas_profiling"
  )

check_setup_rminiconda <- function(env_name) {
  python_for_r <- rminiconda::find_miniconda_python(env_name)
  reticulate::use_python(python_for_r, required = TRUE)
  message(glue("Ambiente `{env_name}` configurado no `reticulate`!"))
}

install_setup_rminiconda <- function(env_name) {
  if (rminiconda::is_miniconda_installed(name = env_name)) {
    message(glue("Ambiente `{env_name}` já existe!"))
    check_setup_rminiconda(env_name)
  } else {
    message("Instalando novo ambiente: `{env_name}`!")
    rminiconda::install_miniconda(name = env_name)
    check_setup_rminiconda(env_name)
  }
}

install_setup_rminiconda(env_name)

rminiconda::test_miniconda(env_name)

pip_install_pkg <- function(pkgs_py, upgrade = FALSE) {
  
  if (upgrade == TRUE) {
    pip_upgrade_arg <- "--upgrade"
  } else {
    pip_upgrade_arg <- ""
  }
  
  pkgs_py %>% 
  map(
    ~rminiconda_pip_install(
      pkg_name = .x,
      name = env_name, 
      args = pip_update_arg
      )
    ) 
}

pip_install_pkg(pkgs_py)
```

