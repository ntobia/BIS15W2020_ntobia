louse <- read.alignment(system.file("sequences/louse.fasta", package = "seqinr"), format = "fasta") 
gopher <- read.alignment(system.file("sequences/gopher.fasta", package = "seqinr"), format = "fasta") 
l.names <- readLines(system.file("sequences/louse.names", package = "seqinr")) 
g.names <- readLines(system.file("sequences/gopher.names", package = "seqinr"))
library(ape)
louse.JC <- dist.dna(as.DNAbin(louse), model = "JC69")
gopher.JC <- dist.dna(as.DNAbin(gopher), model = "JC69")
l <- nj(louse.JC)
g <- nj(gopher.JC)
g$tip.label <- paste(1:8, g.names)
l$tip.label <- paste(1:8, l.names)
layout(matrix(data = 1:2, nrow = 1, ncol = 2), width=c(1.4, 1))
par(mar=c(2,1,2,1))
plot(g, adj = 0.8, cex = 1.4, use.edge.length=FALSE,main = "gopher (host)", cex.main = 2)
plot(l,direction="l", use.edge.length=FALSE, cex = 1.4,main = "louse (parasite)", cex.main = 2)