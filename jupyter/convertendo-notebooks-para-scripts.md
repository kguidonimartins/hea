```bash
find ./notebooks -name "*.ipynb" -not -path "./notebooks/.ipynb_checkpoints/*" | xargs jupyter nbconvert --to script
```
