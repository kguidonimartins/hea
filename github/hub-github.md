# Ferramenta que facilita a interação com repositórios pelo terminal

## Instalação

https://github.com/github/hub#installation

Configure acesso via HTTPS:

```bash
git config --global hub.protocol https
```

## Comandos 

ver: https://hub.github.com/

### Exemplos de uso

Puxando as issues do repositório

```bash
hub issue
```

Criando um repositório no GitHub pelo terminal

```bash
git init
git add .
git commit -m "Initial commit"
hub create # isso vai criar o repositório com o mesmo do repositório atual
git push -u origin HEAD
```







