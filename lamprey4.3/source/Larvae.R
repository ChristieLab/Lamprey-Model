Larvae <- function(parameters) {

  
  pops    <- parameters[["pops"]]
  n.pops  <- length(pops[, 1])
  total.n <- sum(pops[, 2]) # total number of needed larvae

  
  pop <- rep(pops[, 1]+10, pops[, 2]) # create population; add 10 so all two digits

  age <- rep(0:maximum.larval.age, total.n) # create age column
  age <- sample(age, total.n, replace = FALSE)  # age classes are roughly equal at the start of the simulation; could change this to decline with age to speed up "age structure" stabilization
  
  #size <- rnorm(1:length(age), parameters[["shape.parameter"]], parameters[["shape.var"]]) 
  #stage <- 1  # don't need stage - add to unique population
  #sex   <- sample(rep(1:2, total.n*10), total.n, replace = TRUE)
  resistance <- 0
  cost <- 0
  #transform.age <- 0 # 0 will be the default; meaning transfomation has not happened yet
  #extra <- 0
  gtypes <- 0
  
  population <- as.numeric(paste(pop, age, resistance, cost, gtypes, sep = ""))
  #return(population)
}


