# Passando argumentos para o script pelo terminal

Meu amigo precisar fazer uma simples conferência diariamente em uma planilha: cada praia precisa aparecer 11 vezes em cada planilha. Do contrário, ele precisava identificar prontamente quais eram essas praias.

```python
import argparse
import pandas as pd

ap = argparse.ArgumentParser()
ap.add_argument("-e", "--excel", required=True, help="excel file")
ap.add_argument("-n", "--n_praias", required=False, help="número de praias")
args = vars(ap.parse_args())

n = args['n_praias']

if n == None:
    n = 11

df = pd.read_excel(args['excel'], skiprows=9)

# # malandragem para a contagem
# # cria nova coluna com valores igual a 1
df['Contagem_praia'] = 1

checking = df.groupby('Praia').count()

df_praia = checking.reset_index()[['Praia', 'Contagem_praia']]

print(df_praia[df_praia['Contagem_praia'] != int(n)])
```

Pra ser usado assim:

```python
python checagem.py -e "meu_excel.xlsx" -n 11
```


