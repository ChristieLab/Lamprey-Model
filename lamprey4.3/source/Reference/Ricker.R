
S     <- 1:50 # number of spawning females; estimated from pops
alpha <- 4.53
beta  <- 0.0129
e     <- 2


Y <- log(alpha) - beta * S + e

plot(S, Y)

S = 10
Y <- log(alpha) - beta * S + e
Y2 = exp(1)^Y
S*Y2


#alternative create as many as K
K= 1000
S     <- 1:100 # number of spawning females; estimated from pops
R <- K/S
plot(S, R)  # where R equals the per-capita reproductive success
plot(log(S), log(R))

plot(S, R*S)
K/100

n.adults <- 100
K = 1000
r = 0.1
t <- 1:100
Y = (K*n.adults)/(n.adults + ((K-n.adults) * exp(1)^(-r*t)))

plot(t, Y)



n.adults <- 10:1000
K = 1000
r = 0.1
t <- 1
Y = (K*n.adults)/(n.adults + ((K-n.adults) * exp(1)^(-r*t)))

plot(n.adults, Y)




