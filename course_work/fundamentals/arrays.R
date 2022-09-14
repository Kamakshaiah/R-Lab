# arrays
library(geometry)

# Taking two 2D array
vector1 = c(2, 1)
vector2 = c(0, 3)
a = array(c(vector1, vector2), dim = c(2, 2))
print(a)

vector1 = c(4, 2)
vector2 = c(9, 3)
b = array(c(vector1, vector2), dim = c(2, 2))
print(b)

# Calculating dot product using dot()
a * b
a %*% b

t(a) %*% b

dot(a, b)
crossprod(a, b)

t(a) %*% b == crossprod(a, b) # https://stat.ethz.ch/R-manual/R-devel/library/base/html/crossprod.html
