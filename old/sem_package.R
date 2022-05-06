#==========================
# SEM PACKAGE
#==========================

#Useful for demos. Try below statement at console.

structure.diagram(c("a", "b", "c", "d"))



To plot

library(sem)
semfit <- sem(ram, S, N)
plot(semfit)
