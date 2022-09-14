mydf <- read.csv(file.choose())
names(mydf)
dim(mydf)
mydf[, -c(11:128)]
mydf1 <- mydf[, -c(11:128)]
names(mydf1)
library(FactoMineR)
is.numeric(mydf1)
sink("D:/HR Anal/Data/mca1.txt")
my.mca <- MCA(mydf1[, -c(6)])
dimdesc(my.mca)
summary(my.mca)

# cluster analysis 

myhcpc <- HCPC(my.mca)
summary(myhcpc)
myhcpc$desc.var
