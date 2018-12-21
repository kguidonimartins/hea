# Desfazendo um push

Você quer desfazer um *push* (o último *push*, para ser mais preciso). Ache a *hash* do penúltimo *commit* com:

```shell
git log
```

Você pode copiar a *hash* do terminal ou jogá-la diretamente no *clipboard* assim:

```shell
git log --pretty=format:'%h' -n 2 | tail -1 | xclip -sel clip
```

Agora desfaça o *push*:

```shell
git push -f origin hash_do_PENULTIMO-AQUELE-ANTES-DE-VOCE-CAGAR-TUDO_commit:nome_do_branch
```

Se os arquivos desse *push* ainda estiverem em *staged*, então:

```shell
git reset HEAD~
```

[Fonte](https://stackoverflow.com/a/1270608/5974372)

Adendo:

- [Solução clipboard para Mac:](https://coderwall.com/p/gqtdla/git-copy-last-commit-hash-to-clipboard)
    ```shell
    git log --pretty=format:'%h' -n 2 | tail -1 | pbcopy
    ```

- [Solução clipboard para Windows:](https://superuser.com/a/472601)
    ```shell
    git log --pretty=format:'%h' -n 2 | tail -1 | clip
    ```
