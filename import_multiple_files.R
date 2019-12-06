# Grab all files from folder specified #

import_files <- function(mypath,mypattern,...)
{
  tmp.list.1<-list.files(mypath, pattern=mypattern)
  tmp.list.2<-list(length=length(tmp.list.1))
  for (i in 1:length(tmp.list.1)){tmp.list.2[[i]]<-read.csv(tmp.list.1[i],...)}
  names(tmp.list.2)<-tmp.list.1
  tmp.list.2
}

all_data <- import_files("./",".csv$",sep=",")

list2env(all_data,envir=.GlobalEnv)

# Import specific files named in a list - remember to set working directory (setwd("dir-path/folders/") #

list <- list("filename1","filename2")

import_select_files <- function(variable)
{
  file <- ".csv"
  data <- read.csv(paste(variable,file, sep=""))
  assign(variable, data, pos = ".GlobalEnv")
}

mapply(list, FUN = import_select_files)