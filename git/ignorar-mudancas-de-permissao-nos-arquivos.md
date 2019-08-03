# Ignorando mudanças de permissão (chmod) nos arquivos 

Dentro de um diretório git, use:

```bash
git config core.filemode false
```

Para aplicar a múltiplos diretórios, use: 

```bash
for d in `find ~/ -name ".git"`
    do
      cd $d/..
      git config core.filemode false
      echo
    done
```


Fonte: https://github.com/Gizra/KnowledgeBase/wiki/How-to-set-Git-to-ignore-chmod-changes
