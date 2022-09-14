soft.dri.pvalues <- matrix(NA, 1, 4)
soft.dri.pvalues
for(i in 1:dim(my.ord.data)[2]){
  soft.dri.pvalues[, i] <- chisq.test(my.ord.data[,i], my.ord.data[, i+1])$p.value
      }