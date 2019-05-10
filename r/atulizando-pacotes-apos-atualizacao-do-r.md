# Antes de atualizar o R

```r   
tmp = installed.packages()
installedpackages = as.vector(tmp[http://is.na (tmp[,"Priority"]), 1])
save(installedpackages, file="installed_packages.rda")
```

# Atualize o R

```r
load("installed_packages.rda")
for (count in 1:length(installedpackages)) install.packages(installedpackages[count])
```

Fonte: https://twitter.com/lakens/status/1126800584244383745?s=09