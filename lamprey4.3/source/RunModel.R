RunModel <- function(n.generations, i) {
 # i <<- i
  # pops columns are as follows:
  #1-2 population = the population number of larva or adult; 0 = adult pop
  #3 age        = current age in years of the individual
  #4 resistance = no=0; yes=1 
  #5 cost       = cost of resistance  #LIKELY UNUSED (EXTRA PLACEHOLDER)
  #6+ multilocus genotypes
  
  #initialize populations
  larvae    <- Larvae(parameters)  # create larvae
  juveniles <- Juveniles(parameters)
  pops <- c(larvae, juveniles)
  
  first.tfm.year <- parameters["first.tfm.year"]
  last.tfm.year <- parameters["last.tfm.year"]
  reservoirs <- sample(parameters[["pops"]][, 1] + 10, parameters[["n.reservoirs"]])
  
  for(n in 1:parameters[["n.years"]]){
  #  for(n in 1:49){ 
    #increment all all all ages
    pops <- pops + 1000 # increment ages by 1
    
    #if(length(pops) <= one.individual) {break}
    pops     <- Transformation(pops, parameters)
    n.adult  <- length(which(pops >= 900000)) #required for output

    #if(length(pops) <= (one.individual * 3)) {break}   # break if only one adult (or less left)
    # resistant indivduals added in this function at desired year
    pops <- Reproduction(n, pops, parameters, ncols)
  
     #if(length(pops) <= one.individual) {break}   # break if only one adult (or less left)
    pops <- LarvalMortality(pops, parameters)
    
    n.kill <- 0  # default value is 0; changed if TFM is applied
    if(n >= first.tfm.year & n <= last.tfm.year & parameters[["tfm.mortality"]] > 0){   #will run if appropriate year and TFM mortality > 0
      # resistant indivduals coded to survive in this function
      n.alive <- length(pops)  # number alive prior to treatment
      pops    <- TFM(n, parameters, pops, reservoirs)
      n.kill  <- n.alive - length(pops)  # number killed by treatment
      }
  
    #if(length(hosts) <= 7) {break}
    pops <- JuvenileMortality(pops, parameters)
    
    output <- Output(pops, n, n.adult, output, n.kill) # n.kill is returned from TFM.R
    #print(n)
  }

  #plot(output[, 1], output[, 3], ylim = c(0, 10000))
  #points(output[, 1], output[, 5], pch =21, bg = "blue", cex = 2)
  #plot(output[, 1], output[, 5], pch =21, bg = "blue", cex = 2)
  
  out <- cbind(i, parameters[["tfm.mortality"]] ,parameters[["n.treated.streams"]], parameters[["resistance.cost"]], output) 

  write.table(out, paste(outdir, "output.txt", sep=""), row.names = FALSE, col.names = FALSE, sep="\t", append = TRUE)
  
}




