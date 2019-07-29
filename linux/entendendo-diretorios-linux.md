# Entendendo diretórios do Linux

O diretório principal, o `/`, segue o [*Filesystem Hierarchy Standard* (*FHS*)](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard), recomendado pela *Linux Foundation*.

```
/bin    # contém os arquivos binários do sistema: `ls`, `cp`, `mv`
/boot   # contém os arquivos necessários para iniciar o sistema operacional
/cdrom  # diretório legado
/dev    # contém arquivos que correspondem ao hardware: hd, ssd, pendrive, webcam
/etc    # contém configurações globais, independentes do usuário
/home   # contém as configurações locais para cada usuário cadastrado na máquina
/lib    # contém infos sobre os programas
/lib32  # contém infos sobre os programas
/lib64  # contém infos sobre os programas
/media  # local de montagem automática de discos externos
/mnt    # local de montagem manual de discos
/opt    # local opcional onde programas de terceiros podem organizar seus arquivos
/proc   # diretório virtual; arquivos criados após a inicialização do sistema; verifique ID de processo no monitor do sistema
/root   # copia dos arquivos do /home
/run    # diretório virtual; runtime dos programas desde o último boot
/sbin   # contém arquivos binários essenciais "sudo binários"
/snap   # outros tipos de pacotes no ubuntu
/srv    # diretório para servidores
/sys    # diretório virtual; contém informações sobre o sistema, sobre o kernel do linux
/tmp    # diretório de arquivos temporários
/usr    # 
/var    # 
```

https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
