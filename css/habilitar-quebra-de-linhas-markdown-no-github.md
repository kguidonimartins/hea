# Habilitar quebra de linhas em arquivos markdown no github

Esta solução utiliza a extensão [Stylebot](https://chrome.google.com/webstore/detail/stylebot/oiaejidbmkiecgbjeifoejpgmdaleoha?hl=en) no Google Chrome. Instale-a.


Visite [github.com](github.com), clique no ícone da extensão e, depois, em *Open Stylebot*. Ache *Edit CCS* e inclua as linhas abaixo dentro no painel que será aberto.

```css
.type-rmarkdown .blob-code-inner {
    white-space: pre-wrap;
}
```

Feito!

Fonte: encontrei essa solução no [blog](https://yihui.name/en/) do Yihui Xie.