Para aplicar um estilo de fonte a todos os elementos do html, use:

```css
* {
 font-size: 100%;
 font-family: Arial;
}
```

Fonte: https://stackoverflow.com/a/3942399

Ou utilize um Mixin, com o pré-compilador SASS

@mixin font-padrao {
font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;
font-size: 14px;
font-weight: 400;
}

Então ao invés de declarar...

**font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;
font-size: 14px;
font-weight: 400;**

Nas propriedades dos objetos, bastar colocar:
@include font-padrao;

