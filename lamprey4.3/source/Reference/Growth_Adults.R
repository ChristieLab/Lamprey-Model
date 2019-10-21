#==================================================================================================#
# Script created by Mark Christie, contact at Redpath.Christie@gmail.com
# Script created in version R 3.3.1
# This script:  Generates model output for Lampre Resistance project
# Usage notes: Set all parameters below and then source this file
#==================================================================================================#
# Set working directory and output directory
# Directory where model.R and 'source' folder reside

#Von Bert growth funcion!

e <- exp(1)
L = 800    # maximum size
K = 0.0011   # controls shape of the curve
K.sd <- 0.0002
tzero = -200   # size at age 0; shifts curves along x axis
years <- 7

#adults
#L = 800    # maximum size
#K = 0.002   # controls shape of the curve
#K.sd <- 0.0001
#tzero = -15   # size at age 0; shifts curves along x axis
#years <- 6


days     <- seq(from = 1, to = (365*years), by = 10)
k.values <- rnorm(100, K, K.sd)

#note that this is slow, but in model will only have to solve for a single uear (consider using apply)
OUT <- NULL
for(K in k.values){
  for(t in days){
    y   <- L * (1-e^(-K * (t-tzero)))
    out <- cbind(K, t, y)
    OUT <- rbind(OUT, out)
  }
}

par(mar = c(4,5,1,1))
plot(-10, -10, xlim = c(0, max(days)/365), ylim = c(0, L + 10), xlab = "Years post transformation", ylab = "Size (mm)", cex.axis=1.8, cex.lab=2)
rect(par("usr")[1],par("usr")[3],par("usr")[2],par("usr")[4],col = "gray") 
#rect(par("usr")[1]-1,par("usr")[3]-1,par("usr")[2],par("usr")[4],col = "gray", xpd = "FALSE") 

for(n in unique(OUT[, 1])){
  dat <- OUT[OUT[, 1] == n, ] 
  if(dat[, 3][1] > 120){
  lines(dat[, 2]/365, dat[, 3], col = "blue")}
  abline(h=120, lwd=4, lty =2)
  abline(h=450, lty=1, lwd = 4)  # 450 is from Fig. 3 of Hansen 2016
}

