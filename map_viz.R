
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
#For generating our maps we use the ggplot package
#and pass stateName for the map_id aesthetics
#however we first convert it to lower cases for compatibility
#using the tolower function
#we also use the geom_map geometry and fill our map
#by the state area as saved before
#we then use expand_limits to set the limits 
ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Area')
ggsave('usa_area.png')

ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$Murder)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Murder Rate')
ggsave('usa_murder_rate.png')


ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  geom_point(aes(x=df$StateCenterX,y=df$StateCenterY,size=df$population)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Population')
ggsave('usa_pop.png')

nyx <- df[df$stateName=="New York",'StateCenterX']
nyy <- df[df$stateName=="New York",'StateCenterY']

ggplot(df,aes(map_id=tolower(stateName))) +
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
