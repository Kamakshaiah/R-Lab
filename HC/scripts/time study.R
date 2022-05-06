time.df <- read.csv(file.choose())
summary(glm(Outcome ~ Processing.T + Waiting.T + CI + Billing + Pharmacy, data = time.df, family = binomial(link="logit")))
