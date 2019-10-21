TFM <- function(n, parameters, pops, reservoirs) {
  tfm.mortality     <- parameters[["tfm.mortality"]]
  n.treated.streams <- parameters[["n.treated.streams"]]
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  pops    <- pops[pops >= 800000] # remove larvae; will be added in at end 
  
  lpops    <- as.integer(substring(larvae, 1, 2))
  popsizes <- data.frame(table(lpops))
  popsizes <- popsizes[order(popsizes[, 2], decreasing = TRUE), ]
  m1 <- match(reservoirs, popsizes[, 1])   # find and remove reservoirs
  popsizes <- popsizes[-m1, ]    
  streams  <- popsizes[1:n.treated.streams, 1]

  m1 <- match(lpops, streams)
  m2 <- which(is.na(m1) == FALSE)
  untreated <- larvae[-m2]  # isolate streams with larva to not be treated this year

  #keep resitant indivudals alive
  treat     <- larvae[m2] # isolate streams to treat with TFM
  resistant <- treat[which(as.integer(substring(treat, 4, 4)) == 1)] # remove resiant individuals from treatment (dont want to add them twice by accident)
  treated   <- treat[which(as.integer(substring(treat, 4, 4)) == 0)] 

  n.larva   <- length(treated)
  n.kill    <- floor(n.larva * tfm.mortality) # could add variance in tfm.mortality - none added here yet
  
  if(length(n.larva) > 0){ #if statement added to prevent crash with error in 1:n.larva, argument of length zero
  keep      <- sample(1:n.larva, n.larva-n.kill, replace = FALSE) # randomly sample indivduals who survive treatement
  survivors <- treated[keep]
  } else {survivors <- treated}
  
  larvae <- c(untreated, survivors, resistant)
  pops   <- c(larvae, pops)
  return(pops)
}



