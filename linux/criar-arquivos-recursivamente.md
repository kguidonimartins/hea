# Criando arquivos recursivamente

Para criar arquivos dentro de diretórios (incluindo a raiz ./) e subdiretórios, use:

```bash
cd my_project # entre no diretório de trabalho
find . -type d -exec echo {}/README.md  \; # primeiro teste se é isso que você deseja
find . -type d -exec touch {}/README.md  \; # agora crie, de fato
```

Fonte: https://unix.stackexchange.com/questions/94207/recursively-add-a-file-to-all-sub-directories
