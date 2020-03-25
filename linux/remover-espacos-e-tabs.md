```bash
find ./ -type f -not -path "./dir1/*" -not -path "./dir2/*" -exec sed -i -e "s/[ \t]*$//" {} \;
```
