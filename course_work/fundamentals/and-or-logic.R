# and logic
# & executes vectorized logic; && is element-wise logic
# | executes vectorized logic; || element wise logic

x <- sample(c(TRUE, FALSE), 10, replace = T)
y <- sample(c(TRUE, FALSE), 10, replace = T)

x
y
x & y # works for and logic
x | y # works for or logic

x && y # fails
x || y # fails

TRUE && FALSE # works
TRUE && FALSE # works

TRUE & FALSE # works
TRUE & FALSE # works

# below logic works 

x <- sample(c(TRUE, FALSE), 1000000, replace = T)
y <- sample(c(TRUE, FALSE), 1000000, replace = T)

start <- Sys.time()
for ( i in 1:length(x)){
  if (x[i] & y[i])
    print('and-logic')
}
end <- Sys.time()
c(end-start) # Time difference of 8.341227 secs

start <- Sys.time()
for ( i in 1:length(x)){
  if (x[i] && y[i])
    print('and-logic')
}
end <- Sys.time()
c(end-start) # Time difference of 7.950896 secs

# conclusion - it is just about performance difference 
