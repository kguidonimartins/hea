
```r
res_graph <- 200
tiff(filename="pic.tiff", res=res_graph, height=res_graph/72*res_graph, width=res_graph/72*res_graph)
plot(1)
dev.off()
```
