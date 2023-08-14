# url <- "https://www.tandfonline.com/doi/pdf/10.1080/22221751.2020.1775132"
# url <- "https://journals.sagepub.com/doi/full/10.1177/2347631120983481"
# destination<- "D:/Miscel/downloaded_gfg.pdf"
# download.file(url, destination)

library(httr)

url1 <- 'https://www.sec.gov/Archives/edgar/data/0001336528/0001172661-21-001865.txt'
UA <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0"

res   <- GET(url1, add_headers(`Connection` = "keep-alive", `User-Agent` = UA))
data1 <- strsplit(content(res), "\n")[[1]]

head(data1, 20) 
