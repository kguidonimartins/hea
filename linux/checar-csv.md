```bash
for csv in `ls data/clean/*.csv`
  do
    echo 
    echo Filename "$csv"
    echo
    head "$csv" | csvlook  
  done
```


