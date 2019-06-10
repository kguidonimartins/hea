# Importando muitos csv para database

```python
import os
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime

# create a database
con = create_engine('sqlite:///meu-banco-de-dados.db')

# check current path
os.getcwd()

# change to bien occurrences dir
os.chdir('mude/para/o/caminho/se/precisar')

# check path
os.getcwd()

# list all .csv
meus_csvs = list(filter(lambda x: '.csv' in x, os.listdir('.')))

# read and feed database with .csv
start_time = datetime.now()
for csv in meus_csvs:
        um_csv = pd.read_csv(csv)
        um_csv.to_sql(name='minha-tabela', if_exists='append', con=con)
print('\nTime elasped: ', datetime.now() - start_time)
```
