tamanho do diretório

```shell
du -sh
```

liste tamanho dos subdiretórios

```shell
du -sh *
```

liste tamanho dos subdiretórios

```shell
du -sh * | sort -h
```

liste tamanho dos subdiretórios do maior pro menor

```shell
du -sh * | sort -rh
```

<!-- Try something like:

    du -sh *
short version of:

    du --summary --human-readable *

### Explanation:

`du`: **D**isk **U**sage

`-s`: Display a summary for each specified file.  (Equivalent to `-d 0`)

`-h`: "Human-readable" output.  Use unit suffixes: **B**yte, **K**ibibyte (KiB), **M**ebibyte (MiB), **G**ibibyte (GiB), **T**ebibyte (TiB) and **P**ebibyte (PiB). (BASE2) -->
