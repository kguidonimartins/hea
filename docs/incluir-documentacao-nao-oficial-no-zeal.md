# Incluir documentação não-oficial no Zeal

Visite: https://zealusercontributions.herokuapp.com/

Busque a documentação que você precisa, clique no botão `xml` e copie a url da página que será exibida. Abra o Zeal, vá em: Tools > Docset > Add feed e inclua a url que foi copiada anteriormente. Aguarde o download.

Para incluir os ícones, retorne à página que lista a documentação que você deseja e baixe os dois ícones (usando os mesmos nomes) que são mostrados para a pasta da documentação. Por exemplo, a documentação para a biblioteca sklearn fica em (no linux): ~/.local/share/Zeal/Zeal/docsets/Scikit.docset/

Se o link acima estiver quebrado e você já havia configurado o zeal com ele, atualize o link com:

```bash
cd ~/.local/share/Zeal/Zeal/docsets
find . -type f -name "*.json" -exec sed -i 's/zealusercontributions.herokuapp.com/zealusercontributions.now.sh/g' {} +
```
