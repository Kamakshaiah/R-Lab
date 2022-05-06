sentiment_df <- function(x, y, z){

  # simulations
  
  x <- letters[1:5]
  y <- letters[6:10]
  z <- letters[1:20]
  
  #model_y <- c("its", "a", "bad", "day")
  
  #actual <- sample(c("its", "a", "beutiful", "day", "bad"), 50, replace = TRUE)
  
    
  # check - 1
  
  if(!(is.character(x))){warning("The input model data_x is not valid input")}
  if(!(is.character(y))){warning("The input model data_y is not valid input")}
  
  # check - 2
  
  if(length(x) != length(y)){warning("The lengths of two input vectors not mathcing" )}
  
  # dummy variables
  z1 <- matrix(NA, length(x), 1)
  z2 <- matrix(NA, length(y), 1)
  
  # comparisions
  
  for (i in 1:length(x)){
    z1[i] <- sum(x[i]==z)
    z2[i] <- sum(y[i]==z)
  }
  
  df1 <- cbind.data.frame(x, z1)
  df2 <- cbind.data.frame(y, z2)
  
  final_df <- cbind(df1, df2)
  
  return(print(final_df)  )
}

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


# Kruskal Gamma test of statistical significance

kgtest <- function(sim =0, dis =0){
  
  # T Value for similar and disimilar responses
  kgs = (sim-dis)/(sim+dis)
  tval = kgs*sqrt((sim+dis)/(length(let)*(1-kgs^2)))
  # P Value for T value
  pval = pt(abs(tval), length(let)-1)
  # Inference
  if(pval <= 0.05) {infer = "Sentiment is statistically significnat"} else {infer = "Sentiment is not statistically significant"}
  # Result
  return(list(KGS = tval, PValue = pval, Inference = infer))

}

