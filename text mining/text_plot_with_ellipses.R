# text plot 

txt <- "The ratio of COVID-19-attributable deaths versus “true” COVID-19 deaths depends on the synchronicity of the epidemic wave with population mortality; duration of test positivity, diagnostic time window, and testing practices close to and at death; infection prevalence; the extent of diagnosing without testing documentation; and the ratio of overall (all-cause) population mortality rate and infection fatality rate. A nomogram is offered to assess the potential extent of over- and under-counting in different situations. COVID-19 deaths were apparently under-counted early in the pandemic and continue to be under-counted in several countries, especially in Africa, while over-counting probably currently exists for several other countries, especially those with intensive testing and high sensitization and/or incentives for COVID-19 diagnoses. Death attribution in a syndemic like COVID-19 needs great caution. Finally, excess death estimates are subject to substantial annual variability and include also indirect effects of the pandemic and the effects of measures taken."

words <- strsplit(txt, split = ' ')
tbl <- table(words)
tbldf <- data.frame(tbl)
ll <- mean(tbldf['Freq']) - 1.64*(sd(tbldf['Freq']))
ul <- mean(tbldf[,'Freq']) + 1.64*(sd(tbldf[,'Freq']))

nptile <- subset(tbldf, Freq >= ll & Freq <= ul)
plot(tbldf[, 2]); text(tbldf[, 2], labels = tbldf[, 1])

ucom <- subset(tbldf, !(tbldf$words %in% nptile$words ))

library(plotrix)
plot(tbldf[, 2]); text(ucom[, 2], labels = ucom[, 1]); draw.ellipse(0, 7, a = 15, b = 5)
