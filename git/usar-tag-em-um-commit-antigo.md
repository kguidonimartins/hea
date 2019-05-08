# Aplicar `tag` a um commit antigo

Liste, escolha e copie a hash do commit

```bash
git log
```

Aplique a tag 

```bash
git tag -a v1.2 9fceb02 -m "Message here
```

Envie a tag para o remote

```bash
git push --tags origin master
```
