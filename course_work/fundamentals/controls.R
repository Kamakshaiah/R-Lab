# conditionals

ifelse(z[,1] == "yes", 1, 0)

a <- 1; b <- 2; c <- 0.5

if (a < b & a < c){
  print('a is small')
} else if (b < c) {
  print('b is small')
} else {
  print('c is small')
}

# WHILE LOOP

for (i in 1:10){
  print(i)
}

i = 0
while(1){
  i = i + 1
  print(i)
  if(i >= 10) break
}

rep('a', 10)

i <- 1
repeat {
  print('hello')
  i = i + 1
  if(i > 5) {break}
}