# Crie um script:

- Crie um script como seguinte cabeçalho: '#! /usr/bin/env Rscript'

```shell
# crie o script
echo "#! /usr/bin/env Rscript" > script.R
# coloque algum código
echo "plot(1:10)" >> script.R
# veja
cat script.R
```

- Autorize o script:

```shell
chmod 755 script.R
```

- Rode:

```shell
./script.R
```
