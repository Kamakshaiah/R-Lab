# https://www.r-bloggers.com/2013/06/exploratory-data-analysis-kernel-density-estimation-in-r-on-ozone-pollution-data-in-new-york-and-ozonopolis/

## Plot 2 Uniform Kernel Functions with Different Bandwidths

### define support set of X

x = seq(-1.5, 1.5, by = 0.01)

### obtain uniform kernel function values

uniform1 = dunif(x, min = -0.25, max = 0.25)
uniform2 = dunif(x, min = -1.00, max = 1.00)

### optional printing of PNG image to chosen directory

### png('kernels.png')
plot(x, uniform1, type = 'l', ylab = 'f(x)', xlab = 'x', main = '2 Uniform Kernels with Different Bandwidths', col = 'red')

### add plot of second kernel function

lines(x, uniform2, col = 'blue')

### add legend; must specify 'lty' option, because these are line plots

legend(0.28, 1.5, c('Uniform(-0.25, 0.25)', 'Uniform(-1.00, 1.00)'), lty = c(1,1), col = c('red', 'blue'), box.lwd = 1)
# dev.off()

# airquality data

## Kernel Density Estimation

## extract "Ozone" data vector for New York

ozone = airquality$Ozone

## calculate the number of non-missing values in "ozone"
n = sum(!is.na(ozone))

## calculate mean, variance and standard deviation of "ozone" by excluding missing values

mean.ozone = mean(ozone, na.rm = T)
var.ozone = var(ozone, na.rm = T)
sd.ozone = sd(ozone, na.rm = T)

## simulate ozone pollution data for ozonopolis
## set seed for you to replicate my random numbers for comparison

set.seed(1)
ozone2 = rgamma(n, shape = mean.ozone^2/var.ozone+3, scale = var.ozone/mean.ozone+3)

## obtain values of the kernel density estimates

density.ozone = density(ozone, na.rm = T)
density.ozone2 = density(ozone2, na.rm = T)

## number of points used in density plot

n.density1 = density.ozone$n
n.density2 = density.ozone2$n

## bandwidth in density plot

bw.density1 = density.ozone$bw
bw.density2 = density.ozone2$bw
# png('ozone.png')
plot(density.ozone2, main = 'Kernel Density Estimates of Ozone \n in New York and Ozonopolis', xlab = 'Ozone (ppb)', ylab = 'Density', ylim = c(0, max(density.ozone$y, na.rm = T)), lty = 1)

## add second density plot

lines(density.ozone, lty = 3)

## add legends to state sample sizes and bandwidths; notice use of paste()

legend(100, 0.015, paste('New York: N = ', n.density1, ', Bandwidth = ', round(bw.density1, 1), sep = ''), bty = 'n')
legend(100, 0.013, paste('Ozonopolis: N = ', n.density2, ', Bandwidth = ', round(bw.density2, 1), sep = ''), bty = 'n')

# add legend to label plots
legend(115, 0.011, c('New York', 'Ozonopolis'), lty = c(3,1), bty = 'n')
# dev.off()

## Kernel Density Plot with Rug Plot

png('New York.png')
plot(density.ozone, main = 'Kernel Density Plot and Rug Plot of Ozone \n in New York', xlab = 'Ozone (ppb)', ylab = 'Density')
rug(ozone)
# dev.off()
