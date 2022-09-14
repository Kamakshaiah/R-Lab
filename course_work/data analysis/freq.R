# simulation of data sets

x <- abs(round(rnorm(50)*100, 0))
max(x)

# sturges formula

c.w <- ((max(x)-min(x))/5)
a <- sum(x <= 50)
b <- sum(x <= 100)
c <- sum(x <= 150)
d <- sum(x <= 200)
e <- sum(x <= 250)

# bin vector

myf <- c(a, b, c, d, e)
bin <- c("0 to 50", "50 to 100", "100 to 150", "150 to 200", "200 to 250")
mydf <- cbind.data.frame(bin, myf)
myfd <- c(myf[-1], 0)
freq <- myfd - myf
freq <- c(myf[1], freq[-5])

mydfreq <- cbind.data.frame(bin, freq)
# check 

sum(freq)

# export to CSV format

write.csv(mydf, "/media/hi/C2ACA28AACA278951/Windows/work/R/mydf.csv")


## Freq. distribution using loops and conditions

bin <- matrix(NA, 5, 1)
a=0; b=0; c=0; d=0; e=0
for(i in 1:length(x)){
  if(x[i] <= 50){a = a+1}
  else if(x[i] > 50 && x[i] <= 100){b = b+1}
  else if(x[i] > 100 && x[i] <= 150){c = c+1}
  else if(x[i] > 150 && x[i] <= 200){d = d+1}
  else if(x[i] > 200 && x[i] <= 250){e = e+1}
}

cfreq <- c(a, b, c, d, e)
cfreq
sum(cfreq)

hist(cfreq, freq = FALSE); lines(density(cfreq), col = "red")

