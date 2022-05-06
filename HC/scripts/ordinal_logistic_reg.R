# donabedian model

df <- read.csv(file.choose())
names(df)

# crosstabs

lapply(df[, c("outcomes", "structure", "process")], table)
ftable(xtabs(~ outcomes + structure + process, data = df))

# summary 

summary(df$outcomes)

# ordinal logistic reg

library(MASS)

# proportional odds logistic regression 

fit <- polr(outcomes ~ structure + process, data = df, Hess = TRUE)
fit

# coefficients

ctable <- coef(summary(fit))
ctable 

# confint

pvalues <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
pvalues

ctable <- cbind(ctable, "p value" = pvalues)
ctable 

# OR 

ci <- confint(fit)
ci 

# exp(cbind(OR = coef(fit), ci))
cbind(OR = exp(coef(fit)), ci)

plot(fit)
names(fit)
scatter.smooth(fit$fitted.values[, "cured"], fit$fitted.values[, "indifferent"])
fit$deviance
fit$zeta


# glm

fit1 <- glm(I(as.numeric(outcomes) >= 2) ~ structure, family = "binomial", data = df)


## parallel slopes assumption

# sf <- function(y) {
#   c('Y>=1' = qlogis(mean(y >= 1)),
#     'Y>=2' = qlogis(mean(y >= 2)),
#     'Y>=3' = qlogis(mean(y >= 3)))
# }
# 
# (s <- with(df, summary(as.numeric(outcomes) ~ structure + process, fun=sf)))

newdf <- cbind("outcomes" = sample(c("not cured", "indifferent", "cured"), 10, replace = TRUE), 
               "structure" = sample(c("proper", "improper"), 10, replace = TRUE), 
               "process" = sample(c("fair", "unfair"), 10, replace = TRUE))

preddf <- cbind(newdf, predict(fit , newdf, type = "probs"))

head(preddf)

library(reshape2)
preddf <- as.data.frame(preddf)
newdf2 <- melt(preddf, id.vars = c("outcomes", "structure", "process"), variable.name = "Level", value.name = "probability")