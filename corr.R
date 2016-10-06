#Part 3

corr <- function(directory, threshold = 0){
  setwd(directory)
  files_ok = NULL
  corr_vec = numeric(0)
  df_nobs <- subset(complete(directory), Nobs > threshold)
  files <- list.files(path=directory, pattern="*.csv")
  for (i in df_nobs$ID){
    files_ok <- c(files_ok, files[i])
  }
  poll_df <- do.call(rbind,lapply(files_ok, read.csv))
  for(i in df_nobs$ID){
    corr_mx <- cor(subset(poll_df, ID == i & (!is.na(nitrate) | !is.na(sulfate)), select=c(nitrate, sulfate)), use="complete")
    corr_vec <- c(corr_vec, corr_mx[1,2])
  }
  corr_vec
}

#directory <- c("~/Documents/coursera_R/specdata/")
#threshold = 500
#a <- corr(directory, threshold)
#b <- corr(directory)
#head(a)
#summary(a)