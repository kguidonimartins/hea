# Trocar navegador padrão

Uso o Google Chrome (com o proxy da Universidade configurado) e o Firefox simultaneamente. Em alguns casos, eu prefiro utilizar um dos navegadores como padrão. Para evitar ter que entrar nas configurações de cada navegador marcá-lo como padrão, eu utilizo dois *scripts*:

O primeiro é para configurar o Google Chrome como padrão.

```shell
echo "xdg-settings set default-web-browser google-chrome.desktop" > casa.sh
```

Para executá-lo, use:

```shell
sh casa.sh
```

O segundo é para configurar o Firefox como padrão.

```shell
echo "xdg-settings set default-web-browser firefox.desktop" > ufg.sh
```

Para executá-lo, use:

```shell
sh ufg.sh
```
