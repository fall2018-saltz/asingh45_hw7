
#Here we merge our two dataframes by using the merge function in R 
#which uses a common column for merging which in this case is the stateName column
merged_df <- merge(x=census,y=arrests)

