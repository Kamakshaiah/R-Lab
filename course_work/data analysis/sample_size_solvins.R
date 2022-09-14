pop <- seq(1, 1000000, 10)
ss <- (pop/(1+pop*0.05^2))
plot(ss, pop)

plot(log(pop), pop)

hist(pop, freq = FALSE); lines(density(pop))
hist(log(pop), freq = FALSE); lines(density(log(pop)))

hist(ss, freq = FALSE); lines(density(ss))
