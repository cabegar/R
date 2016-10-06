#Part 1

pollutantmean <- function(directory, pollutant, id = 1:332){
  setwd(directory)
  files <- list.files(path=directory, pattern="*.csv")
  poll_df <- do.call(rbind,lapply(files[id],read.csv))
  if (pollutant == "nitrate") {
    a <- mean(poll_df$nitrate,na.rm=TRUE)
  } else if (pollutant == "sulfate") {
    a <- mean(poll_df$sulfate,na.rm=TRUE)
  } else{
    print("Pollutant error")
  }
}

#directory <- c("~/Documents/coursera_R/specdata/")
#a <- pollutantmean(directory,"nitrate",1:10)
#b <- pollutantmean(directory,"sulfate",1:10)
#c <- pollutantmean(directory,"sulfate",15)
#d <- pollutantmean(directory,"nitrate",72:70)
