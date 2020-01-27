library(tidyr)
library(reshape2)

setwd(dirname(rstudioapi::getSourceEditorContext()$path))

civpart <- read.csv("civil-partnerships-engwal.csv")
colnames(civpart)[1] <- "Year"

# Melt data using reshape2
melted_CPs <- melt(civpart, id=c("Year", "ENGLAND", "WALES"))

# Separate the countries
eng_cp <- melted_CPs[,-3]
wales_cp <- melted_CPs[,-2]

eng_cp2 <- spread(eng_cp, variable, ENGLAND)
wales_cp <- spread(wales_cp, variable, WALES)

eng_cp3 <- spread(eng_cp2,value, Sex)
wales_cp <- spread(wales_cp,value, Sex)