library(rgl)
open3d()

x <- seq(0, 10, length=100)
y <- seq(0, 10, length=100)


z = outer(x,y, function(x,y) dnorm(x,2.5,1)*dnorm(y,2.5,1))

persp3d(x, y, z,col = rainbow(100))

#$ dpkg -S /usr/include/GL/gl.h
# mesa-common-dev: /usr/include/GL/gl.h

cord.x <- c(-3,seq(-3,-2,0.01),-2) 
cord.y <- c(0,dnorm(seq(-3,-2,0.01)),0) 
curve(dnorm(x,0,1),xlim=c(-3,3),main='Standard Normal') 
polygon(cord.x,cord.y,col='skyblue')


# Define the Mean and Stdev
mean=1152
sd=84

# Create x and y to be plotted
# x is a sequence of numbers shifted to the mean with the width of sd.  
# The sequence x includes enough values to show +/-3.5 standard deviations in the data set.
# y is a normal distribution for x
x <- seq(-3.5,3.5,length=100)*sd + mean
y <- dnorm(x,mean,sd)

plot(x, y, type="l")
polygon(c( x[x>=1250], 1250 ),  c(y[x>=1250],0 ), col="red")
polygon(c( x[x<=1100], 1100 ),  c(y[x <=1100],0 ), col="red")


# binomial

n = 100; s = 10; p = seq(0.1, 0.9, 0.1)

par(mfrow=c(3, 3))

for (i in 1:9){
  x = rbinom(n, s, p[i])
  hist(x, main = paste("Binom", p[i]))
  lines(density(x))
  }

p = seq(1, 100, 1)

for (i in 1:length(p)){
  x = rpois(n, p[i])
  hist(x, main = paste("Poise for", p[i]))
  lines(density(x))
  Sys.sleep(0.2)
  dev.off()
}

par(reset = TRUE)
dev.off()

