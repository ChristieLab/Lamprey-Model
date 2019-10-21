Replicates <- function(parameters, n.replicates) {
  # takes all *.set variables and creates the precise number of replicates for each variable
 
  resistance.cost   <- c(1)
  last.tfm.year     <- c(200)
  #n.treated.streams <- c(1, 2, 3, 4, 5, 6)
  n.treated.streams <- c(5)
   
 replicates <- expand.grid(resistance.cost, last.tfm.year, n.treated.streams)
 replicates <- replicates[rep(seq_len(nrow(replicates)), n.replicates), ]
 
 return(replicates)
}  
