K = 1000
n = 1:1000
egg.multiplier <- 0.5
egg.addition <- 0
egg.max <- 50
  
n.egg <- K/(n/2)

n.egg <- (n.egg * egg.multiplier) + egg.addition
n.egg[n.egg > egg.max] <- egg.max


plot(n, n.egg, ylim = c(0, 50), col = "blue")
#plot(n, n.egg, ylim = c(0, 10), col = "blue")

#
egg.multiplier <- 0.5
egg.addition <- 5
egg.max <- 5

n.egg <- K/(n/2)

n.egg <- (n.egg * egg.multiplier) + egg.addition
n.egg[n.egg > egg.max] <- egg.max


points(n, n.egg, ylim = c(0, 50), col = "purple")
