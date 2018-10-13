
#Here we read our census data into a dataframe and further clean in 
#by removing unwanted rows, columns and giving them logical names
clean_df <- function(){
  census <- data.frame(census)
  census <- census[-c(1,53),c(5:8)]
  colnames(census) <- c("stateName","population","popOver18","percentOver18")
  return(census)
}
#Finall we save it in a dataframe object and pass it on for further processing
census <- clean_df()
