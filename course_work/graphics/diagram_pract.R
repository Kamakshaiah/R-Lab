library(diagram)

par(mar=c(1, 1, 1, 1), mfrow = c(2, 2))
names <- c("A", "B", "C", "D")
M <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)

plotmat(M) # a simple plot with circles
plotmat(M, pos = c(1, 2, 1), name = names, lwd = 1, box.lwd = 2, cex.txt = 0.8, box.size = 0.1, box.type = "square", box.prop = 0.5) # plot with squares

M[2, 1] <- M[3, 1] <- M[4, 2] <- M[4, 3] <- "beta"

plotmat(M, pos = c(1, 2, 1), curve = 0, name = names, lwd = 1, box.lwd = 2, cex.txt = 0.8, box.size = 0.1, box.type = "square", box.prop = 0.5) # plot with squares
