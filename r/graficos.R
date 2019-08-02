# criar vetores de 1 a 10
eixo.x <- 0:10
eixo.y <- 0:10

# gráfico de x contra y
?plot

# plot simples sem qualquer argumento extra
plot(eixo.x, eixo.y)

# outros parâmetros gráficos
?par

# opções de símbolos para pontos
?points

# função para salvar o gráfico
tiff(
     filename = "meu-grafico.tiff",  # nome do gráfico
     width    = 300 / 72 * 300,      # largura do gráfico
     height   = 300 / 72 * 300,      # altura do gráfico
     res      = 300                  # resolução do gráfico
    )

# função para margens
# c(bottom, left, top, right)
# The default is c(5, 4, 4, 2) + 0.1.
par(
    mar = c(     # margin size in:
            5.1, # bottom
            4.1, # left
            4.1, # top
            2.1  # right
            )
    )

# plot com argumentos extras
plot(
    x          = eixo.x,      # para o eixo x
    y          = eixo.y,      # para o eixo y
    type       = "p",         # "p" para pontos; "l" para linhas; "c" para tal
    xlim       = c(0, 10),    # limites do eixo x
    ylim       = c(0, 10),    # limites do eixo y
    main       = "Título",    # tíutlo principal do gŕafico
    sub        = "Subtítulo", # subtítulo do gráfico
    xlab       = "Eixo de X", # nome do eixo x
    ylab       = "Eixo de Y", # nome do eixo y
    ann        = TRUE,        # se o textos fora do gráfico devem aparecer; dispensável
    axes       = FALSE,       # se o eixos devem aparecer; dispensável
    xaxt       = "t",         # "t" para se os ticks e números do eixo x devem aparecer
    yaxt       = "t",         # "t" para se os ticks e números do eixo y devem aparecer
    frame.plot = TRUE,        # se o quadro do gráfico deve aparecer
    asp        = 0,           # proporção entre y e x
    adj        = 0.5,         # justificação do texto: 0.5 para centro, 1 para direita e 0 para esquerda
    bg         = 100,         # background color
    bty        = "o",         # estilo do quadro em volta do gráfico: padrão "o"
    cex        = 2,           # tamanho do símbolo: padrão 1
    cex.axis   = 1,           # tamanho dos números dos eixos
    cex.lab    = 1.2,         # tamanho das legendas dos eixos
    cex.main   = 3,           # tamanho do título
    cex.sub    = 1,           # tamanho do subtitulo
    col        = "blue",      # cor do contorno dos pontos
    las        = 1,           # rotacionar texto dos ticks: 0 para y, 1 padrão, 2 para x, 3 para x e y
    pch        = 22,          # tipo de símbolo
    tck        = NA,          # comprimentos dos ticks; padrão NA
    xaxp       = c(0, 10, 5), # quantos ticks em x; padrão c(0,10,5)
    yaxp       = c(0, 10, 5), # quantos ticks em y; padrão c(0,10,5)
    lty        = 2,           # tipo de linha; 0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash)
    lwd        = 1            # espessura da linha
)

# fecha o gráfico
# necessário depois da função `tiff()`
dev.off()
