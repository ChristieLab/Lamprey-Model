LarvalMortality <- function(pops, parameters) {
  #adults  <- pops[pops >= 900000] # isolate all adult stage lamprey
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  juveniles <- pops[pops >= 800000 & pops < 900000]
  k.larvae  <- parameters[["pops"]]
  larval.survival.var <- parameters[["larval.survival.var"]]
  maximum.larval.age  <- parameters[["maximum.larval.age"]]

  #n.larvae <- table(larvae[, 1])
  n.pops   <- length(k.larvae[, 1])

  larva.mortality <- round(rnorm(n.pops, k.larvae[, 2], larval.survival.var)) # really how many to keep

  lpops <- as.integer(substring(larvae, 1, 2))
  OUT <- NULL
  for(n in 1:n.pops){
    pop1  <- larvae[lpops == n + 10] #+10 becuase pops start at 11
    keep  <- larva.mortality[n]  # how many larvae to keep
    if (keep < length(pop1)){
      pop1 <- sample(pop1, keep, replace = FALSE)
    }

    OUT <- c(OUT, pop1)
  }  
  
  larvae <- OUT
  pops <- c(larvae, juveniles)#, adults)
  return(pops)
}



