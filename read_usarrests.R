
#Getting the USArrests dataframe and storing it in a dataframe object for our use
arrests <- USArrests
#As the name of the states are saved as the row names in this dataframe we 
#create a new column for this data for further merging
arrests['stateName'] <- row.names(arrests)

