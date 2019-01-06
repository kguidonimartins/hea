
# [Crie a tag com mensagem][primeiro]

```shell
git tag -a <tagname> -m '<message>'
```

# [Push a tag][segundo]

```shell
git push origin --tags
```

***

# Você também pode 'tegar' um commit (indicado)

Busque a *hash* do commit:

```shell
git log --pretty=oneline
```

Um exemplo de resultado do comando acima:

```shell
$ git log --pretty=oneline
15027957951b64cf874c3557a0f3547bd83b3ff6 Merge branch 'experiment'
a6b4c97498bd301d84096da251c98a07c7723e65 beginning write support
0d52aaab4479697da7686c15f77a3d64d9165190 one more thing
6d52a271eda8725415634dd79daabbc4d9b6008e Merge branch 'experiment'
0b7434d86859cc7b8c3d5e1dddfed66ff742fcbc added a commit function
4682c3261057305bdd616e23b64b0857d832627b added a todo file
166ae0c4d3f420721acbb115cc33848dfcc2121a started write support
9fceb02d0ae598e95dc970b74767f19372d61af8 updated rakefile
964f16d36dfccde844893cac5b347e7b3d44abbc commit the todo
8a5cbc430f1a9c3d00faaeffd07798508422908a updated readme
```

Aplique a *hash* do commit escolhido ao comando (por exemplo, o terceiro commit do log acima):

```shell
git tag -a <tagname> -m '<message>' 9fceb02d0ae598e95dc970b74767f19372d61af8
```

[primeiro]: https://stackoverflow.com/questions/11514075/what-is-the-difference-between-an-annotated-and-unannotated-tag
[segundo]: https://stackoverflow.com/questions/18216991/create-a-tag-in-github-repository
