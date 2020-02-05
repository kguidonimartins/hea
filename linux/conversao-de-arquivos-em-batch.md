# Conversão de arquivos em batch

```bash
#!/usr/bin/env bash

# Template for batch converting-like. You can use this for move, rename, 
# convert, copy files, etc.
# You need to set the proper converting function inside the loop.
# For example, changing file extension from .txt to .md:
#     for i in *."${FROM}"
#     do 
#       echo Converting from "${i}" to "${i%.*}.${TO}"
#       mv "${i}" "${i%.*}.${TO}"
#     done
# And use in terminal as follow:
# sh from-to txt md

FROM=$1
TO=$2

for i in *."${FROM}"
do 
  echo Converting from "${i}" to "${i%.*}.${TO}"
  # include your commands here
done
```


