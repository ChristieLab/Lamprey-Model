#Note: this is the default file; all variables are manimpulated in Replicates.R
# If a parameter has a value of NA; it is varied directly in Replicates.R

#Input parameters
parameters <- list()          # all parameters must be added to this list (see code below section break : ======)

#Timing parameters
n.years              <- 200   # total number of years in the model
first.tfm.year       <- 50    # year of first TFM treatment
resistant.year.added <- 70    # year that resitant adults are added; as currently coded, must come after first.tfm.year

#TFM mortality 
tfm.mortality     <- 0.9        # percent of larvae killed by TFM
n.treated.streams <- NA        # number of treated streams
n.reservoirs      <- 1         # number of resivor streams
last.tfm.year     <- NA        # last year of TFM treatment

#Resistance parameters
n.resistant.adults <- 1       # n adults will be coded as resistant (added randomly to spawing populations); only occurs once at "resitant.year.added" in Reproduction.R
resistance.cost    <- NA      # cost of resistance, to fecundity       


# Demographic parameters
pops <- 1:20 # total n. pops
K    <- c(
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000,
12000) # local larval pop sizes (must be added indivdually - could easily modify this as needed)

k.juveniles 				        <- 80000  # total number of juveniles in large panmictic population
maximum.larval.age  			  <- 3     # maximum age for larval lamprey; used only for setting up populations (LARVAE.R)
minimum.juvenile.age  			<- 3     # what is the youngest age to find juveniles
maximum.juvenile.age   			<- 7     # maximim age for a juvenile lamprey 
maximum.juvenile.life.span 	<- 3     # maximim juvenile life span - still being used?
juvenile.survival.var 			<- c(20) # density independent survival variance for juveniles 
larval.survival.var 				<- c(70) # density independent survival variance for larvae 
#egg parameters: see CurrentCompensatoryPopulationSizes.R for details
egg.max                     <- 50    # maximum number of eggs per pair ()
egg.multiplier              <- 0.5   # how much to knock down number of pairs (slows growth rate; set to 0.5)
egg.addition                <- 0     # set egg multiplier low (e.g., 0.01) and egg.addition and egg.max to 10 for complete density independence 

# Growth parameters
#y   <- L * (1-e^(-K * (t-tzero)))
maximum.larval.size <- 150 # equal to L in above equation
maximum.adult.size  <- 800 # equal to L in above equation
transform.threshold <- 120 # size at which all larvae above will transform into juveniles
adult.threshold     <- 450 # size at which all juveniles will transform into adults
shape.parameter     <- 0.0011 # equal to K in above equation
shape.var           <- 0.0002 # how much within-population, between-individual variation do we want. analagous to k.sd in growth.R
e                   <- exp(1) # equal to e in above equation
tzero               <- -15   # size at age 0, all sizes in mm, shifts lines left or right along x-axis (could add variation in egg size/provisioning by varying this parameter)

# adaptive genetic parameters
n.loci        		     <- 1  
n.alleles              <- 1  # all non-resistant to start f

#see GenotypeCrossProbabilities
gtype.key <- rbind(
  cbind("00", 0, 0, 0, 0),
  cbind("22", 2, 2, 2, 2),
  cbind("11", 0, 1, 1, 2),
  cbind("02", 1, 1, 1, 1),
  cbind("12", 1, 1, 2, 2),
  cbind("10", 0, 0, 1, 1),
  cbind("20", 1, 1, 1, 1),
  cbind("21", 1, 1, 2, 2),
  cbind("01", 0, 0, 1, 1))  
  

# Add all parameters to list===============================================================#
parameters[["n.years"]] <- n.years
parameters[["first.tfm.year"]] <- first.tfm.year
parameters[["resistant.year.added"]] <- resistant.year.added

parameters[["tfm.mortality"]] <- tfm.mortality
parameters[["n.treated.streams"]] <- n.treated.streams 
parameters[["n.reservoirs"]] <- n.reservoirs         # number of resivor streams
parameters[["last.tfm.year"]] <- last.tfm.year         # number of resivor streams

parameters[["n.resistant.adults"]] <- n.resistant.adults
parameters[["resistance.cost"]] <- resistance.cost         # number of resivor streams


pops <- cbind(pops, K)
parameters[["pops"]] <- pops

parameters[["k.juveniles"]] <- k.juveniles 
parameters[["maximum.larval.age"]] <- maximum.larval.age 
parameters[["minimum.juvenile.age"]] <- minimum.juvenile.age 
parameters[["maximum.juvenile.age"]] <- maximum.juvenile.age 
parameters[["maximum.juvenile.life.span"]] <- maximum.juvenile.life.span 
parameters[["juvenile.survival.var"]]  <- juvenile.survival.var 
parameters[["larval.survival.var"]] <- larval.survival.var
parameters[["egg.max"]] <- egg.max
parameters[["egg.multiplier"]] <- egg.multiplier
parameters[["egg.addition"]] <- egg.addition

parameters[["maximum.larval.size"]] <- maximum.larval.size 
parameters[["maximum.adult.size"]]  <- maximum.adult.size  
parameters[["transform.threshold"]] <- transform.threshold
parameters[["adult.threshold"]]     <- adult.threshold
parameters[["shape.parameter"]]  <- shape.parameter   
parameters[["e"]] <-e                   
parameters[["tzero"]] <- tzero          
parameters[["shape.var"]]<-shape.var

parameters[["n.loci"]] <- n.loci 
parameters[["n.alleles"]] <- n.alleles 
parameters[["gtype.key"]] <- gtype.key
