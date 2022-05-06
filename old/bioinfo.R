library(seqinr)

malus <- read.fasta(file.choose())
banana <- read.fasta(file.choose())

den <- read.fasta(file.choose())

malus_seq <- malus$NW_007545883.1
banana_seq <- banana$DX451975.1

var.test(table(malus_seq), table(banana))

coef_phi <- function(n, k){
  return(sqrt(k^2/n))
}

r_from_f <- function(f, df1, df2){
  return(sqrt(f/(f + (df1/df2))))
}

# plots
comp_plot <- function(seq1, seq2){
  par(mfrow = c(1, 2))
  barplot(table(seq1), col = 1:4)
  barplot(table(seq2), col = 1:4)
  
}

cor_sig_test <- function(r, n){
  t <- r * sqrt((n-2)/(1-r^2))
  p_value <- pt(abs(t), n-1)
  return(list(tstat = t, pvalue = p_value))
}

r = length(malus_seq)
c = length(banana_seq)

n <- sqrt(((r-1)/r)*((c-1)/c))^4
#n <- sqrt(((length(malus_seq)-1)/malus_seq)*((banana_seq-1)/banana_seq))



for (i in length(den1.seq)){
  if (den1.seq[i] == "a"){
    x[i] = 1
  }
}

x = matrix(NA, length(den1.seq), 1)

for (i in 1:length(den1.seq)){
  if (den1.seq[i] == "a"){x[i] <- 1}
  else if(den1.seq[i] == "t"){x[i] <- 2}
  else if(den1.seq[i] == "c"){x[i] <- 3}
  else if(den1.seq[i] == "g"){x[i] <- 4}
  }

y = matrix(NA, length(ban.seq), 1)

for (i in 1:length(ban.seq)){
  if (ban.seq[i] == "a"){y[i] <- 1}
  else if(ban.seq[i] == "t"){y[i] <- 2}
  else if(ban.seq[i] == "c"){y[i] <- 3}
  else if(ban.seq[i] == "g"){y[i] <- 4}
}

z = sample(den1.seq, length(ban.seq), replace = TRUE)

z_s = matrix(NA, length(z), 1)

for (i in 1:length(z)){
  if (den1.seq[i] == "a"){y[i] <- 1}
  else if(den1.seq[i] == "t"){y[i] <- 2}
  else if(den1.seq[i] == "c"){y[i] <- 3}
  else if(den1.seq[i] == "g"){y[i] <- 4}
}


