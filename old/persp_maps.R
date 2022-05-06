# persepective maps

# cost curving

x <- seq(-10, 10, length = 30)
y <- x
f <- function(x, y){r <- sqrt(x^2+y^2); cos(r)/r}
z <- outer(x, y, f)
persp(x, y, z)

# sin cuve

f <- function(x, y){r <- sqrt(x^2+y^2); cos(r)/r}
z <- outer(x, y, f)
persp(x, y, z)
