# source - https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Simple-manipulations-numbers-and-vectors
# vectors 
x <- 1:5
x <- c(10.4, 5.6, 3.1, 6.4, 21.7) # left assignment 
assign("x", c(10.4, 5.6, 3.1, 6.4, 21.7))
c(10.4, 5.6, 3.1, 6.4, 21.7) -> x # right assignment
y <- c(x, 0, x)

# vector arithmetic
1/x
v <- 2*x + y + 1
sum((x-mean(x))^2)/(length(x)-1)

# sequences

seq(-5, 5, by=.2) -> s3
s4 <- seq(length=51, from=-5, by=.2)
s5 <- rep(x, times=5)
s6 <- rep(x, each=5)

print(s5)
print(s6)

# vector logic

temp <- x > 13

# missing values & special characters

z <- c(1:3,NA);  ind <- is.na(z)
0/0
Inf - Inf

# character vectors

labs <- paste(c("X","Y"), 1:10, sep="")
c("X1", "Y2", "X3", "Y4", "X5", "Y6", "X7", "Y8", "X9", "Y10")

# Index vectors

y <- x[!is.na(x)]

(x+1)[(!is.na(x)) & x>0] -> z
x[1:10]
c("x","y")[rep(c(1,2,2,1), times=4)]
y <- x[-(1:5)]

fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange", "banana", "apple", "peach") # naming vectors
lunch <- fruit[c("apple","orange")]

x[is.na(x)] <- 0

y[y < 0] <- -y[y < 0]
y <- abs(y)