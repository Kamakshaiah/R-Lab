# RBlockchain 

install.packages("Rbitcoin")
library(Rbitcoin)

# anti DDoS

wait <- antiddos(market = 'kraken', antispam_interval = 5, verbose = 1)
market.api.process('kraken',c('BTC','EUR'),'ticker')
wait2 <- antiddos(market = 'kraken', antispam_interval = 5, verbose = 1)
market.api.process('kraken',c('BTC','EUR'),'ticker')