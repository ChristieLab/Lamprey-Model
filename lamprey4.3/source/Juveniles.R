Juveniles <- function(parameters) {


  minimum.juvenile.age <- parameters[["minimum.juvenile.age"]]
  maximum.juvenile.age <- parameters[["maximum.juvenile.age"]]
  k.juveniles          <- parameters[["k.juveniles"]]
  pop <- 80            #juvenile pop number/stage == 80
  age <- rep(minimum.juvenile.age:maximum.juvenile.age, k.juveniles)
  age <- sample(age, k.juveniles, replace = FALSE)  # age classes are roughly equal at the start of the simulation; could change this to decline with age to speed up "age structure" stabilization
  
  #size <- rnorm(1:length(age), parameters[["shape.parameter"]], parameters[["shape.var"]])
  
  #stage <- 2
  #sex   <- sample(rep(1:2, k.juveniles*10), k.juveniles, replace = TRUE)
  resistance <- 0
  cost <- 0
  #transform.age <- age
  #transform.age <- sample(rep(2:5, k.juveniles), k.juveniles, replace = FALSE) # age at transformation
  #extra <- 0
  gtypes <- 0

  population <- as.numeric(paste(pop, age, resistance, cost, gtypes, sep = ""))
}


