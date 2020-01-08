# Para exibir mensagem customizadas ao abrir o terminal, instale o `figlet`.

```bash
sudo apt install figlet
```

Consulte as fontes disponíveis com:

```bash
showfigfonts
```

## Exemplo

Suponha que você queria que o terminal avise em qual `branch` seu repositório está. Para isso, use:

```bash
git branch | grep -i '*' | awk '{print "branch: " $2 }' | figlet
```

Para que essa mensagem seja exibida sempre, inclua o comando acima no arquivo `/etc/bash.bash.rc`

