# data simulations

satisfaction <- sample(1:3, 10, replace = T)
attitude <- sample(1:3, 10, replace = T)
awareness <- sample(1:2, 10, replace = T)

# data frame

customerdata <- data.frame(satisfaction, attitude, awareness)
typeof(customerdata)
class(customerdata)
summary(customerdata$satisfaction)
summary(customerdata$attitude)
summary(customerdata$awareness)

plot(customerdata$satisfaction)

write.csv(customerdata, 'customer-data.csv')

names(customerdata)
head(customerdata)
tail(customerdata)

# matrix 

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C.1", "C.2", "C.3")))

dmat <- matrix(1:90, 30, 3, )
head(dmat)
tail(dmat)
dim(dmat)
is.matrix(dmat)
names(dmat)

dmat <- matrix(runif(90, 10, 100), 30, 3, dimnames = list(c(1:30), c('v1', 'v2', 'v3')))
head(dmat)
dmat[, 'v1']
rownames(dmat)
colnames(dmat)

# summary statistics

summary(dmat[, 'age'])
plot(dmat[, 'age'])
scatter.smooth(dmat[, 'age'])

is.matrix(dmat)

# data frame 

x <- data.frame(dmat)
is.matrix(x)
is.data.frame(x)
names(x)
names(dmat)

is.list(dmat)
is.list(x)

