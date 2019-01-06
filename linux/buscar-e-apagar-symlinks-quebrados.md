# Buscas e apagar symlinks quebrados

Listando os symlinks quebrados que estão no diretório ".":

```shell
find . -type l -xtype l
```

Lista detalhada:

```shell
find . -type l -xtype l -exec ls -la {} \;
```

Apagando interativamente:

```shell
find . -type l -xtype l -exec rm -vi {} \;
```

Fontes:
- https://www.commandlinefu.com/commands/view/8260/find-broken-symlinks
- https://www.cyberciti.biz/faq/linux-unix-how-to-find-and-remove-files
