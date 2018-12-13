# Install nbextensions

```shell
conda install -c conda-forge jupyter_contrib_nbextensions
```

Enable extensions in toolbar: Edit > nbextensions config

# Enable extensions via command line

```shell
# my list:
jupyter nbextension enable zenmode/main
jupyter nbextension enable table_beautifier/main
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable ruler/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable comment-uncomment/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable highlighter/highlighter
jupyter nbextension enable toc2/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable hide_input/main
jupyter nbextension enable splitcell/splitcell
```

Fontes:

Descobri aqui: https://towardsdatascience.com/jupyter-notebook-extensions-517fa69d2231

Resolvi o problema de instalação aqui: https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html#conda
