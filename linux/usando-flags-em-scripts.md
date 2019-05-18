# Usando flags em scripts

Assumindo um script `my_script.sh` com o seguinte conteúdo:

```bash
#!/bin/bash

while [ ! $# -eq 0 ]
do
	case "$1" in
		--hello | -h)
      echo "Hello, World!"
      exit
			;;
		--bye | -b)
			echo "Bye!"
			exit
			;;
	esac
	shift
done
```

Para obter o resultado "Hello, World!", use:

```bash
./my_script.sh -h
```

Para obter o resultado "Bye!", use:

```bash
./my_script.sh -b
```

Fonte: https://jonalmeida.com/posts/2013/05/26/different-ways-to-implement-flags-in-bash/
