mydf
edit(mydf)

summary(lm(Loss ~ 0 + I(L_ACS^2) + I(L_ANCS^2) + I(L_TF^2) + I(L_O^2), data = mydf))
