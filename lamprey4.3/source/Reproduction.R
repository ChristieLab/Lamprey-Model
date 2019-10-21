Reproduction <- function(n, pops, parameters, ncols) {
  adults  <- pops[pops >= 900000] # isolate all adult stage lamprey
  larvae  <- pops[pops < 800000] # larvae that are alread alive;
  juveniles <- pops[pops >= 800000 & pops < 900000]
  k.pops  <- parameters[["pops"]]
  n.resistant.adults <- parameters[["n.resistant.adults"]]
  year.added <- parameters[["resistant.year.added"]]
  gtype.key <- parameters[["gtype.key"]]
  resistance.cost <- parameters[["resistance.cost"]]
  egg.max <- parameters[["egg.max"]]
  egg.multiplier  <- parameters[["egg.multiplier"]]
  egg.addition    <- parameters[["egg.addition"]]  
   
  # add resistant individuals
  if(n == resistant.year.added){
    r.inds <- sample(1:length(adults), n.resistant.adults, replace = FALSE)
    adults[r.inds] <- adults[r.inds] + 101
  }

  n.adults <- length(adults)
  
  # randomly pair individuals (sex determined here)
  females <- adults[seq(1, length(adults), 2)]
  males <- adults[seq(2, length(adults), 2)]
  n.pairs <- min(c(length(females), length(males)))
  allpairs   <- cbind(males[sample(1:n.pairs, replace = FALSE)], females[sample(1:n.pairs, replace = FALSE)])
  
  # allocate pairs based on larval abundances (would be interesting to turn this off and see how this affects evolution)
  real.pops  <- data.frame(table(as.integer(substring(larvae, 1, 2))))
  real.pops  <- cbind(real.pops, real.pops[, 2]/sum(real.pops[, 2]))
  real.pops  <- cbind(real.pops, floor(real.pops[, 3] * n.pairs))
  real.pops  <- cbind(real.pops, cumsum(real.pops[, 4]))

  start <- c(1, real.pops[, 5] + 1)
  start <- start[-length(start)]
  stop  <- real.pops[, 5]

  POPS <- NULL
  for(npop in 1:length(real.pops[, 1])){
    pairs <- allpairs[seq(start[npop], stop[npop], 1), ,drop=FALSE]   
    
    #n.egg <- 1000
    n.egg <- as.integer(round(k.pops[npop, 2]/length(pairs[, 1]))) # caculate number of offspring per pair, not size based, see Ricker.R
    n.egg <- (n.egg * egg.multiplier) + egg.addition
    if(n.egg < 1) {n.egg <- 1}
    if(n.egg > egg.max) {n.egg <- egg.max}
    
    # COULD ADD COST OF INFECTION/RESISTANCE RIGHT HERE (IF INFECTED, THEN LOWER REPRO OUTPUT)
    # Below creates offspring
    gtype1  <- as.integer(substring(pairs[, 1], 6, 6))
    gtype2  <- as.integer(substring(pairs[, 2], 6, 6))
    gtypes  <- paste(gtype1, gtype2, sep="")
    m1 <- match(gtypes, gtype.key[, 1])
    sample.frame <- gtype.key[m1, -1]  # create matrix to sample from with apply
    
    res <- which(as.numeric(gtypes) > 0) #identify resistant pairs
    
    if(length(res) < 1) {res <- 1} #offspring sampling if there are no resistant individualsm add cost to first individual (prevents crashing)
    sample.frame1 <- sample.frame[-res, , drop = FALSE] #no resistant pairs, use n.egg
    sample.frame2 <- sample.frame[res, , drop = FALSE] #resistant pairs, use n.egg * resistance.cost
    
    offs1 <- as.vector(apply(sample.frame1, 1, sample, n.egg, replace = TRUE))
    offs2 <- as.vector(apply(sample.frame2, 1, sample, n.egg*resistance.cost, replace = TRUE))
    OFFS <- as.numeric(c(offs1, offs2))
    
    

    pair.scept <- OFFS # add pair.scepts (i.e., resistnace)
    pair.scept[pair.scept > 0] <- 1

  POPS <- rbind(POPS, cbind(npop+10, OFFS, pair.scept)) #+10 needed to get correct pop
  }
  


  popls      <- POPS[, 1]
  age        <- 1
  resistance <- POPS[, 3]  # may need to change this when introduce resitance
  gtypes     <- POPS[, 2]
  cost       <- 0
  
  new.larvae <- as.numeric(paste(popls, age, resistance, cost, gtypes, sep = ""))
  pops <- c(larvae, new.larvae, juveniles)  # add new.larvae 
  return(pops)
}

