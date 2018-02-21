# Buscar commits por mensagem

Você quer buscar por *commits* que contenham palavras específicas, use:

```shell
git log -i --all --grep='tExTo'
```

Onde:
 - `log`: exibe a lista de *commits*
 - `-i` : ignora diferenças entre letras maiúsculas e minúsculas
 - `--all`: exibe a lista inteira de *commits*
 - `--grep`: busca o texto desejado

[Fonte](https://stackoverflow.com/a/7124949/5974372)
