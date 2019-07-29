# Configurando {reticulate}

Primeiro, configure o `.Renviron` para usar a versão python do anaconda:

```bash
echo "RETICULATE_PYTHON='~/anaconda3/bin/python3.7'" >> .Renviron
```

Confira no R a versão que está sendo utilizada:


```r
reticulate::py_config()
```

O output esperado seria:


```
> reticulate::py_config()
python:         /home/karlo/anaconda3/bin/python3.7
libpython:      /home/karlo/anaconda3/lib/libpython3.7m.so
pythonhome:     /home/karlo/anaconda3:/home/karlo/anaconda3
version:        3.7.1 (default, Dec 14 2018, 19:28:38)  [GCC 7.3.0]
numpy:          /home/karlo/anaconda3/lib/python3.7/site-packages/numpy
numpy_version:  1.15.4
keyword:        /home/karlo/anaconda3/lib/python3.7

NOTE: Python version was forced by RETICULATE_PYTHON
```

Link para "version 'ZLIB_1.2.9' not found": https://stackoverflow.com/a/48579743
