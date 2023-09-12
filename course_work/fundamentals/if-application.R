gender <- sample(c('m', 'f'), 10, replace = T)
gendercats <- vector()
for (i in 1:length(gender)){
  if (gender[i] == 'm'){
    gendercats[i] <- 1
  } else {
    gendercats[i] <- 2
  }
}

data.frame(gender, gendercats)
