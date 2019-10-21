


x <- 1:2000
y <- 1200/x

plot(x, y, xlim = c(0, 200))

plot(x, log(y/x), xlim = c(0, 200))
plot(x, log(y/x), xlim = c(0, 50))
