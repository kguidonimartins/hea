# Desfazendo um push

Você quer desfazer um *push*, use:

```shell
# Ache a hash do commit com:
git log
# Agora:
git push -f origin hash_do_commit:nome_do_branch
```

Os arquivos desse *push* ainda estão *commitados*, então:

```shell
git reset HEAD~
```

[Fonte](https://stackoverflow.com/a/1270608/5974372)
