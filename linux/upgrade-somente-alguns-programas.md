# upgrade somente alguns programas

Quando a lista de `sudo apt update` retorna a lista de programas para serem atualizados (verifique com: `apt list --upgradable`), podemos escolher aqueles que queremos atualizar com o `sudo apt upgrade`.

```bash
sudo apt --only-upgrade install firefox
```

Fonte: https://askubuntu.com/a/656555
