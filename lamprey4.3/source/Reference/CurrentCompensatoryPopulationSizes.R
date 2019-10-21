K = 1000
n = 1:1000

n.eggs <- K/(n/2)

plot(n, n.eggs, ylim = c(0, 50))
points(n, n.eggs*.5, col = "blue") #Dont delete, 0.5 == egg.multipler, 
points(n, n.eggs*.25, col = "blue")
points(n, (n.eggs*.01)+10, col = "blue") #Don't delete +10 == egg.addition

points(n, (n.eggs*.5)+5, col = "blue") #Don't delete +10 == egg.addition


plot(n, n.eggs)
points(n, n.eggs*.5, col = "blue")
points(n, n.eggs*.25, col = "blue")


plot(n, n.eggs, xlim = c(0, 20))
points(n, n.eggs*.5, col = "blue")
points(n, n.eggs*.25, col = "blue")
