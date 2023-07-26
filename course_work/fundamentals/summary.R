salary <- round(runif(30, 20, 100))
summary(salary) # <-|
unclass(summary(salary)) # <-|
data.frame(unclass(summary(salary))) # <-|

ttestres <- t(data.frame(unclass(t.test(salary)))[1, ])
typeof(ttestres)
# write.csv(t(data.frame(unclass(t.test(salary)))[1, ]), 't-test.csv')
write.csv(ttestres, 't-test.csv')

gender <- sample(c('male', 'female'), 30, replace = T)
chisq.test(table(gender))
data.frame(unclass(chisq.test(table(gender))))[1, ]
chitestres <- t(data.frame(unclass(chisq.test(table(gender))))[1, ])
# typeof(chitestres)

write.csv(chitestres, 'chisqtestres.csv')