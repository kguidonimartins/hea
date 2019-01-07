# Reconfigurar comando principal

Mudança de `ctrl+b` para `ctrl+a`, e mudança do indexador dos paineis começando em 1:

Abra um novo arquivo chamado `.tmux.conf`:

```shell
vim .tmux.conf
```

Cole os seguintes comandos:

```shell
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
# Start window numbering at 1
set -g base-index 1
```

Fonte: https://medium.com/actualize-network/a-minimalist-guide-to-tmux-13675fb160fa
