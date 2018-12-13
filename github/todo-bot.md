https://github.com/JasonEtco/todo

# create a `.github` folder and a `config.yml` file inside it.

```shell
mkdir .github
cd .github
> config.yml
```
# Insert below config in the `config.yml` file

```yml
todo:
  keyword: ["@todo", "TODO"]     # string|string[]
  bodyKeyword: ["@body", "BODY"] # string|string[]
  blobLines: 5                   # number|boolean, 0 or false to disable
  autoAssign: false              # string|string[]|boolean
  label: true                    # boolean|string|string[]
  reopenClosed: true             # boolean

```
