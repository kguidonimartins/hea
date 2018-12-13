# Find git repos

```shell
clouds='Documents Dropbox GoogleDrive1 GoogleDrive2'
for d in `find ~/$clouds -name ".git"`
   do
     cd $d/..
     echo `pwd`:
     git status
     echo
     cd
   done
```
