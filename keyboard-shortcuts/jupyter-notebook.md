<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:0 orderedList:0 -->

- [Atalhos de teclados e alguns outros macetes do Jupyter Notebook](#atalhos-de-teclados-e-alguns-outros-macetes-do-jupyter-notebook)
	- [Acessando paleta de comandos](#acessando-paleta-de-comandos)
	- [Comandos em modo de navegação](#comandos-em-modo-de-navegao)
	- [Comandos em modo de edição](#comandos-em-modo-de-edio)
	- [Comandos independentes dos modos de navegação e de edição](#comandos-independentes-dos-modos-de-navegao-e-de-edio)
- [Outros truques](#outros-truques)
	- [Imprindo múltiplas variáveis de uma mesma célula (sem a necessidade de declarar o `print()`)](#imprindo-mltiplas-variveis-de-uma-mesma-clula-sem-a-necessidade-de-declarar-o-print)
	- [Comandos mágicos](#comandos-mgicos)
	- [Rodando ou carregando scripts externos ao jupyter notebook](#rodando-ou-carregando-scripts-externos-ao-jupyter-notebook)
	- [Listando variáveis do ambiente](#listando-variveis-do-ambiente)
	- [Guardando o código de uma célula em um arquivo externo](#guardando-o-cdigo-de-uma-clula-em-um-arquivo-externo)
	- [Exibindo conteúdo de arquivos externos em um *popup*](#exibindo-contedo-de-arquivos-externos-em-um-popup)
	- [Executando comandos do *shell*](#executando-comandos-do-shell)
	- [Usando diferentes linguagens no jupyter notebook](#usando-diferentes-linguagens-no-jupyter-notebook)
	- [Usando python e R simultaneamente](#usando-python-e-r-simultaneamente)
- [Fontes](#fontes)

<!-- /TOC -->

# Atalhos de teclados e alguns outros macetes do Jupyter Notebook

## Acessando paleta de comandos

- `Ctrl` + `Shift` + `P` : paleta de comandos (não funciona no Firefox 57)

- `Ctrl` + `Shift` + `F` : paleta de comandos

## Comandos em modo de navegação

- `Esc`                  : entra no modo de navegação

- `B`                    : insere uma nova célula abaixo

- `M`                    : muda o tipo de texto para markdown

- `Y`                    : muda o tipo de texto para código

- `A`                    : insere uma nova célula acima

- `C`                    : copia a célula selecionada

- `X`                    : recorta a célula selecionada

- `V`                    : cola célula copiada/recortada abaixo da célula selecionada

- `Shift` + `V`          : cola célula copiada/recortada acima da célula selecionada

- `J` e `K`              : navegação pelas células

- `↓` e `↑`              : navegação pelas células

- `D` + `D`              : deleta célula

- `Z`                    : desfaz última deleção de célula

- `1` a `6`              : insere cabeçalhos do markdown

- `Shift` + `↓` ou `J`   : seleciona múltiplas células para baixo

- `Shift` + `↑` ou `K`   : seleciona múltiplas células para cima

- `Shift` + `M`          : mescla múltiplas células selecionadas

- `Shift` + `L`          : exibe os números das linhas das células com código

- `S`                    : salva notebook e cria *checkpoint*

- `Ctrl` + `S`           : salva notebook e cria *checkpoint*

- `F`                    : busca e substitue texto da célula

- `O`                    : esconde *output* da célula

- `H`                    : exibe painel com atalhos de teclado

- `I` + `I`              : interrompe o *kernel*

- `0` + `0`              : reinicia o *kernel*

- `Space`                : rola notebook para baixo

- `Shift` + `Space`      : rola notebook para cima

## Comandos em modo de edição

- `Enter`                : entra no modo de edição

- `Shift` + `Tab`        : exibe documentação da função (o cursor deve estar posicionado sobre a função)

- `Ctrl` + `Shift` + `-` : divide a célula a partir da posição do cursor

- `Tab`                  : completa código

- `Ctrl` + `]`           : indenta código

- `Ctrl` + `[`           : desfaz indentação do código

- `Ctrl` + `A`           : seleciona todo o texto da célula

- `Ctrl` + `Z`           : desfaz alterações do texto da célula

- `Ctrl` + `/`           : Comenta código

- `Ctrl` + `Shift` + `Z` : redo

- `Ctrl` + `Home`        : vai para o início da célula

- `Ctrl` + `↑`           : vai para o início da célula

- `Ctrl` + `End`         : vai para o final da célula

- `Ctrl` + `↓`           : vai para o final da célula

- `Ctrl` + `←`           : anda para próxima palavra à esquerda

- `Ctrl` + `→`           : anda para próxima palavra à direita
- `Ctrl` + `Backspace`   : deleta a palavra anterior - `Ctrl` + `Del`         : deleta a palavra posterior 
## Comandos independentes dos modos de navegação e de edição

- `Ctrl` + `Enter`       : executa texto da célula

- `Shift` + `Enter`      : executa texto da célula e passa para célula abaixo

- `Alt` + `Enter`        : executa texto da célula e insere nova célula abaixo

# Outros truques

## Imprindo múltiplas variáveis de uma mesma célula (sem a necessidade de declarar o `print()`)

Duas alternativas:

A primera é declarando o comando abaixo no próprio jupyter notebook:

```python
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"
```

A segunda é criando o arquivo `~/.ipython/profile_default/ipython_config.py` com o comando abaixo. Isso habilita a opção de impressão de múltiplas variáveis de uma mesma célula para todas as instâncias e todos os notebooks rodados no meu computador. ~~Não funcionou comigo, ainda.~~ *Reboot* necessário.

```shell
echo -e 'c = get_config()\n\n# Run all nodes interactively\nc.InteractiveShell.ast_node_interactivity = "all"' | sudo tee ~/.ipython/profile_default/ipython_config.py
sudo chown -R $USER ~/.ipython/profile_default/ipython_config.py
```

## Comandos mágicos

```python
%lsmagic
```

## Rodando ou carregando scripts externos ao jupyter notebook

```python
%run ./meu-outro-jn.ipynb
```

ou

```python
%load ./meu-script.py
```

## Listando variáveis do ambiente

```python
%who
```

## Guardando o código de uma célula em um arquivo externo

```python
%%writefile pythoncode.py

import numpy
def append_if_not_exists(arr, x):
    if x not in arr:
        arr.append(x)

def some_useless_slow_function():
    arr = list()
    for i in range(10000):
        x = numpy.random.randint(0, 10000)
        append_if_not_exists(arr, x)

```

## Exibindo conteúdo de arquivos externos em um *popup*

```python
%pycat pythoncode.py
```

## Executando comandos do *shell*

```python
!ls -ll
!pip install numpy
```

## Usando diferentes linguagens no jupyter notebook

```python
%%bash
%%HTML
%%python2
%%python3
%%ruby
%%perl
```

Por exemplo:

```python
%%bash
for i in {1..5}
do
   echo "i is $i"
done
```

## Usando python e R simultaneamente

Primeiro carregue a biblioteca `rpy2`

```python
%load_ext rpy2.ipython
```

No topo de cada célula para códigos em R, insira `%%R`, por exemplo:

```r
%%R

install.packages("ggplot2")
```

# Fontes

- Visualização de atalhos do próprio Jupyter Notebook: `Esc` + `H`

- [Gist do kidpixo](https://gist.github.com/kidpixo/f4318f8c8143adee5b40)

- [Dataquest: 28 Jupyter Notebook tips, tricks, and shortcuts](https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/)
