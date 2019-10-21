JuvenileMortality <- function(pops, parameters) {
  # remember that there is inly 1 juvenile population
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  juveniles <- pops[pops >= 800000 & pops < 900000]
  juvenile.survival.var <- parameters[["juvenile.survival.var"]]
  k.juveniles           <- parameters[["k.juveniles"]]

  keep  <- round(rnorm(1, k.juveniles, juvenile.survival.var))
  
  if(keep < length(juveniles)){ 
    juveniles <- sample(juveniles, keep, replace=FALSE) # will cause a crash if not enough juveniles!
  }

  pops <- c(larvae, juveniles)
  return(pops)
}



