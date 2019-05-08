# Calcular tempo de execução de scripts

Use no topo do script:
```shell
start_time <- Sys.time()
```

Use no final do script:
```shell
end_time <- Sys.time()
end_time - start_time
```