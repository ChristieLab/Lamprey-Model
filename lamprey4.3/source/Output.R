Output <- function(pops, n, n.adult, output, n.kill) {
  if(n == 1) {output <- NULL}
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  juveniles <- pops[pops >= 800000 & pops < 900000]
   
  n.larvae <- length(larvae)
  n.juveniles <- length(juveniles)
  
  #resistant.larvae
  status <- as.integer(substring(larvae, 4, 4))
  n.resistant <- length(which(status == 1))
  
  output.new <- cbind(n, n.adult, n.juveniles, n.larvae, n.resistant, n.kill)
  output <- rbind(output, output.new)
  return(output)
    
}
