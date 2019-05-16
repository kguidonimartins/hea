# Trabalhar progressivamente evitando muitos commits pequenos

A [ideia](https://happygitwithr.com/repeated-amend.html) é trabalhar com amends. Ao inserir uma modificação, faça um commit, insira outra modificação, faça um amend, insira outra modificação, faça outro amend, ..., finalize com um amend descritivo e faça o push.

```bash
# primeiro commit da nova feature
git commit -m "WIP"
# segundo commit
git commit --amend --no-edit
# --no-edit mantém a mensagem do primeiro commit
# terceiro commit 
git commit --amend --no-edit
# feature finalizada
git commit --amend -m "Subindo nova feature; close #2"
``` 

Fonte: https://happygitwithr.com/repeated-amend.html
