#Part 2

complete <- function(directory, id = 1:332){
  setwd(directory)
  lst <- data.frame(numeric(0), numeric(0))
  files <- list.files(path=directory, pattern="*.csv")
  poll_df <- do.call(rbind,lapply(files[id],read.csv))
  for(i in id){
    rbind(lst,c(ID = i, nobs = nrow(subset(poll_df, ID == i & !(is.na(nitrate) | is.na(sulfate)))))) -> lst
  }
  colnames(lst) <- c("ID","Nobs")
  lst
}

#directory <- c("~/Documents/coursera_R/specdata/")
#a <- complete(directory,1)
#b <- complete(directory,c(2,4,8,10,12))
#c <- complete(directory,30:25)
#d <- complete(directory,3)