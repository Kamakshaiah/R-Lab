f <- file("/dev/pts/2", open="r")
nObs <- 50
Temperature <- rep(NA, nObs)
cycle <- 0
while(cycle<10){
  time <- ((cycle*nObs):((cycle+1)*(nObs)))[-1]
  plot(Temperature ~ time, t="n", ylim=c(18, 24), 
       main="Data stream from Arduino via USB port")
  for(i in 1:nObs){
    Temperature[i] <- scan(f, n=1, quiet=TRUE)
    points(i + cycle*nObs, Temperature[i], pch=19)
    Sys.sleep(0.05)
  }
  cycle <- cycle + 1
}
close(f)
