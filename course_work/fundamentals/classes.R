# class conversions 

x <- 1
typeof(x) # double
class(x) # numeric

y <- 1.5
typeof(y) # double
class(y) # numeric

z <- 'mk'
typeof(z) # double
class(z) # numeric

## vectors vs. factors [numeric to character ]
nums <- sample(c(1, 2), 10, replace = T)
is.vector(nums) # true

typeof(nums) # double
class(nums) # numeric

res <- sample(c('yes', 'no'), 10, replace = T)
print(res)

is.vector(res) # true

typeof(res) # character
class(res) # character

# converting character to numeric [class change]
res_num <- as.numeric(as.factor(res))
print(res_num)
typeof(res_num) # character
class(res_num) # character

# data matrices and frames

mat <- matrix(1:20, 5, 4)
print(mat)
typeof(mat)
class(mat)

dataf <- data.frame(mat)
print(dataf)
typeof(dataf)
class(dataf)

is.list(mat)
as.list(mat) # it is not data frame

x1 <- round(runif(10)*100)
x2 <- round(runif(10)*100)
x3 <- round(runif(10)*100)

list_one <- list(x1, x2, x3)
print(list_one)
typeof(list_one)
class(list_one) # it is list

list_df <- data.frame(list_one)
colnames(list_df) <- c('v1', 'v2', 'v3')
print(list_df)

typeof(list_df)
class(list_df) # it is data frame

mat_df <- as.matrix(list_df)
print(mat_df)
class(mat_df) # converted to matrix
is.matrix(mat_df) # true

