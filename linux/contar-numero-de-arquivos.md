# Contar número de arquivos em um diretório

Você quer contar o número de arquivos em um diretório, use:

```shell
sudo find . -print | grep -i '.*[.]pdf' | wc -l
```

## Por partes:

Para exibir todos os arquivos:

```shell
sudo find . -print
```

Para exibir todos os *pdf's*:

```shell
sudo find . -print | grep -i '.*[.]pdf'
```

Para contabilizar o número de arquivos:

```shell
sudo find . -print | grep -i '.*[.]pdf' | wc -l
```


Onde:

- `find`: função built-in de busca
- `.`: diretório no qual você está
- `-print`: exibe o resultado
- `|`: *pipes* que conectam resultados de funções
- `grep`: função built-in que busca expressões
- `-i`: ignora diferenças entre maiúsculas e minúsculas
- `'.*[.]pdf'`: todos os arquivos que terminam com `.pdf`
- `wc`: função `word count`
- `-l`: conta as linhas

[Fonte](https://askubuntu.com/questions/307876/how-to-search-for-files-recursively-into-subdirectories)
