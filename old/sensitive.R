
x <- c("its", "a", "beutiful", "day")
y <- c("its", "a", "bad", "day")

let <- sample(c("its", "a", "beutiful", "day", "bad"), 50, replace = TRUE)

z1 <- matrix(NA, 4, 1)
z2 <- matrix(NA, 4, 1)

for (i in 1:length(x)){
  z1[i] <- sum(x[i]==let)
  z2[i] <- sum(y[i]==let)
}

beuti <- cbind.data.frame(x, z1)
bad <- cbind.data.frame(y, z2)

mydf <- cbind.data.frame(beuti, bad)
mydf[3,]

senti <- mydf[3, 2] - mydf[3, 4]

if(senti >= 0) {print("There is positive sentiment in the data")} else {print("There is negative sentiment in the data")}

kgtest <- function(pos =0, neg =0){
  
  tcal = (pos-neg)/(pos+neg)
  pval = pt(tcal, length(x)-1)
  return(list(KGS = tcal, PValue = pval))
}