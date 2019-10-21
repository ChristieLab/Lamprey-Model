Transformation <- function(pops, parameters) {
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  juveniles <- pops[pops >= 800000 & pops < 900000]
  
  #larval transformations (to juvenile stage)
  transform.threshold <- parameters[["transform.threshold"]]
  L <- parameters[["maximum.larval.size"]]
  e <- parameters[["e"]]
  K <- rnorm(1:length(larvae), parameters[["shape.parameter"]], parameters[["shape.var"]])
  t <- as.integer(substring(larvae, 3, 3)) * 365 #extract age in years and multiply by days

  tzero <- parameters[["tzero"]]
  larv.sizes <-  L * (1-e^(-K * (t-tzero)))
  new.juvs <- which(larv.sizes >= transform.threshold)
  larvae[new.juvs] <- as.integer(substring(larvae[new.juvs], 3, 6)) + 800000
  
  #juvenile transformations (to adult stage)  - everything should transform after a single year as a juvenile!
  adult.threshold <- parameters[["adult.threshold"]]
  L <- parameters[["maximum.adult.size"]]
  e <- parameters[["e"]]
  t <- as.integer(substring(juveniles, 3, 3)) * 365 #extract age in years and multiply by days
  K <- rnorm(1:length(juveniles), parameters[["shape.parameter"]], parameters[["shape.var"]])
  
  tzero <- parameters[["tzero"]]
  juv.sizes <-  L * (1-e^(-K * (t-tzero)))
  new.adults <- which(juv.sizes >= adult.threshold)
  #new.adults <- which(is.na(match(new.adults, juvs)) == FALSE)
  juveniles[new.adults] <- as.integer(substring(juveniles[new.adults], 3, 6)) + 900000
  
  pops <- c(larvae, juveniles)
  return(pops)
}



