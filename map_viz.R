
#We start by loading our libraries
library(ggplot2)
library(ggmap)
library(maps)
#Next the center data for all the states
df['StateCenterX']<-state.center$x
df['StateCenterY']<-state.center$y
#We also retrieve the area for states 
#and save it in our dataframe
df['StateArea']<-state.area
#We use the map_data function to get 
#map data like longitude & latitude for
#US states
us <- map_data("state")

#Step B: Generate a color coded map
#For generating our maps we use the ggplot package
#and pass stateName for the map_id aesthetics
#however we first convert it to lower cases for compatibility
#using the tolower function
#we also use the geom_map geometry and fill our map
#by the state area as saved before
#we then use expand_limits to set the limits 
#according to the longitude and latitude data 
#and use coord_map to give the plot a real map look
#add a title using ggtitle and save it using ggsave
usa_area <- ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Area')
ggsave('usa_area.png')

#Step C: Create a color shaded map of the U.S. based on 
#the Murder rate for each state 
#In this case we use the above approach but fill our map
#with the murder rate variable
ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$Murder)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Murder Rate')
ggsave('usa_murder_rate.png')

#To further add Population using points we use geom_point geometry
#and set the size argument as population values, also we place
#these points at the center of states using the center
#lat-long saved previously
ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  geom_point(aes(x=df$StateCenterX,y=df$StateCenterY,size=df$population)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Population')
ggsave('usa_pop.png')

#Step D: Zoom the map
#to zoom the map we merely adjust the axis limits to make our visualization
#focus on a certain aspect
#to look at the north eastern states we first obtain the center coordinates 
#for NY state 
nyx <- df[df$stateName=="New York",'StateCenterX']
nyy <- df[df$stateName=="New York",'StateCenterY']

#Next we use the earlier approach to make the map 
#however also  add the limits using xlim and ylim
#in coord_map and set these to a value +/-10 from
#NY state
usa_ne_mr <-  ggplot(df,aes(map_id=tolower(stateName))) +
 geom_map(map=us,aes(fill=df$Murder)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map(xlim=c(nyx-10,nyx+10),ylim=c(nyy-10,nyy+10)) +
  ggtitle('North East Murder Rate')
ggsave('usa_ne_mr.png')

ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  geom_point(aes(x=df$StateCenterX,y=df$StateCenterY,size=df$population)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map(xlim=c(nyx-10,nyx+10),ylim=c(nyy-10,nyy+10)) +
  ggtitle('North East Population')
ggsave('usa_ne_pop.png')
