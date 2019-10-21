#==================================================================================================#
# Script created by Mark Christie, contact at Redpath.Christie@gmail.com
# Script created in version R 3.3.2
# This script:  Generates model output for Lampre Resistance project
# Usage notes: Set all parameters below and then source this file
#==================================================================================================#
# Set working directory and output directory
# Directory where model.R and 'source' folder resides

#setwd("C:/Users/Mark Christie/Dropbox/papers/lamprey_model/Model/lamprey4.3")
setwd("E:/Drive/papers/lamprey_model/model/lamprey4.3")



base.directory <- getwd()
outdir <- paste(base.directory,"/output/",sep="")  # directory to save model output  
source(paste(base.directory, "/source/FunctionSourcer.R", sep = '')) #loads packages, sources functions, and sets source directory


n.replicates  <- 1    # number of replicates for each combination of parametmers


#==========================================================================================================#
replicates <- Replicates(parameters, n.replicates)
#i <- 180

for(i in 1:length(replicates[, 1])){
  
  parameters[["resistance.cost"]] <- replicates[i, 1]  # tfm.mortality
  parameters[["last.tfm.year"]] <- replicates[i, 2]  # tfm.mortality
  parameters[["n.treated.streams"]] <- replicates[i, 3]  # tfm.mortality
  model<- RunModel(n.generations, i)
}


