for(i in 1:10){
  x <- abs(round(rnorm(10)*100, 0))
  if(x > 10 && x < 100){plot(x, pch = 12, col = "red")} else {plot(x, ylim = c(min(x), max(x)))}
  Sys.sleep(1)
  dev.off()
}


for(i in 1:50){
  x <- abs(round(rnorm(10)*100, 0))
  hist(x, freq = FALSE)
  lines(density(x), col = "red", add = TRUE)
  Sys.sleep(0.2)
  dev.off()
}

for(i in 1:50){
  x <- abs(round(rnorm(10)*100, 0))
  plot(x, sin(x)); lines(sin(x), add = TRUE)
  Sys.sleep(0.2)
  dev.off()
}
