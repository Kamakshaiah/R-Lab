# matrix with linear number series

dmat <- matrix(1:96, 16, 6, dimnames = list(c(1:16), c('gender', 'salary','age','education','family','satisfaction')))

class(dmat)

dmat[16, 6]
tail(dmat)
dmat[11, 3] <- NA
tail(dmat)

head(dmat)
tail(dmat)

dmat[,'education']

write.csv(dmat, 'data-matrix.csv')

dataset <- read.csv(file.choose())

head(dataset)
tail(dataset)

class(dataset)
