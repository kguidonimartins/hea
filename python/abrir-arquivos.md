Por padrão, open() abre o arquivo em modo de leitura

```python
arquivo = open("cidades.txt")
```

Lê todas as linhas no arquivo e retorna o resultado em uma lista

```python
lines = arquivo.readlines()
```

Experimente escrever print(lines) aqui

```python
arquivo.close()  # fecha o arquivo
```

Se você quiser ser mais explícito, você pode escrever o comando aberto assim:

```python
arquivo = open("cidades.txt", "r")
```

O “r” significa apenas ler o arquivo. Você também pode abrir um arquivo em “rb” (read binary / leia binário), “w” (write / escrita), “a” (append / acrescentar), ou “wb” (write binary / escreva binário). Note que se você usar um “w” ou “wb”, o Python irá substituir o arquivo se ele já existe ou criá-lo se o arquivo não existe. O “a” acrescentará informações sem apagar as que já estão no arquivo.

Se você quiser ler o arquivo, você pode usar os seguintes métodos:

- read – lê o arquivo inteiro e retorna tudo em uma string
- readline – lê a primeira linha do arquivo e retorna como uma string
- readlines – lê o arquivo inteiro e retorna como uma lista de strings

Você também pode ler um arquivo com um loop, como este:

```python
arquivo = open("cidades.txt")
for linha in arquivo:
    print (linha)
arquivo.close()
```

ABRIR UM ARQUIVO COM SEU PROGRAMA PADRÃO

Python tem um método simples para abrir um arquivo com seu programa padrão, vamos abrir a calculadora como exemplo:

```python
import os
os.startfile("calc.exe")
# ou
import os
os.startfile(r"C:\Users\israel\Desktop\Programa Qualquer.exe")
```

Sim, é assim tão fácil, se você estiver no Windows. Se você estiver em Unix ou Mac, você vai precisar do módulo subprocess ou “os.system”

```python
import subprocess
caminho_arquivo_pdf = r"C:\Users\israel\Desktop\ArquivoQualquer.pdf"
caminho_programa = r'C:\Program Files (x86)\Adobe\Reader 10.0\Reader\AcroRd32.exe'
subprocess.Popen("{} {}".format(caminho_programa, caminho_arquivo_pdf))
```

Você também pode escrever a última linha como: subprocess.Popen ([caminho_programa, caminho_arquivo_pdf]). Usar o módulo subprocess também é muito fácil. Há muitas outras maneiras de usar esse módulo, mas esta é uma das suas principais tarefas. Eu costumo usá-lo para abrir um arquivo específico (como acima) ou para abrir um programa com argumentos específicos aplicados.

[Fonte](https://debuggingonthetable.wordpress.com/2015/06/19/como-ler-ou-abrir-um-programa-com-python/)
