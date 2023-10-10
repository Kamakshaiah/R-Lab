# correlation 
x <- sample(1:10)
y <- sample(1:10)

cor(x, y) # pearson
cor(x, y, method = 'spearman')
cor(x, y, method = 'kendall')

plot(x, y)
scatter.smooth(x, y)

head(USArrests)
cor(USArrests) # multivariate 

plot(cor(USArrests)) # not appropriate
heatmap(cor(USArrests))

cor.test(USArrests) # not correct

dim(USArrests)

for (i in 1:dim(USArrests)[2]){
  if (i == dim(USArrests)[2]){
    ct <- cor.test(USArrests[, i], USArrests[, 1])
    print(c(ct$statistic, ct$p.value))
  } else {
    ct <- cor.test(USArrests[, i], USArrests[, i+1])
    print(c(ct$statistic, ct$p.value))  
  }
    
  print(i)
  
}
