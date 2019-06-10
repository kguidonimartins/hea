# Importando csv grande para database

```python
import pandas as pd
from sqlalchemy import create_engine

con = create_engine('sqlite:////caminho/absoluto/para/o/banco/de/dados/meu-banco-de-dados.db')

meu_csv_grande = pd.read_csv('meu-arquivo.csv', chunksize=1000)

for fatia in meu_csv_grande:
    fatia.to_sql(name='minha-tabela', if_exists='append', con=con)
```
