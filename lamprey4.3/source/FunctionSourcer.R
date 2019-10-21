#FunctionSourcer <- function() {
# Set working directory, import packages, source functions, 
setwd(paste(base.directory,"/source/", sep = ''))    # set temp working directory 
#library(fields)  # used for calculation of pathogen dispersal distance matrix

source(paste(getwd(), "/Larvae.R", sep = ''))
source(paste(getwd(), "/Juveniles.R", sep = ''))
#source(paste(getwd(), "/Genotypes.R", sep = ''))
source(paste(getwd(), "/Reproduction.R", sep = ''))
source(paste(getwd(), "/TFM.R", sep = ''))
source(paste(getwd(), "/Transformation.R", sep = ''))
source(paste(getwd(), "/LarvalMortality.R", sep = ''))
source(paste(getwd(), "/JuvenileMortality.R", sep = ''))
source(paste(getwd(), "/IncrementAges.R", sep = ''))
source(paste(getwd(), "/Output.R", sep = ''))
source(paste(getwd(), "/Parameters.R", sep = ''))
source(paste(getwd(), "/Replicates.R", sep = ''))
source(paste(getwd(), "/RunModel.R", sep = ''))
