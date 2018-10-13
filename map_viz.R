
library(ggplot2)
library(ggmap)
library(maps)
df['StateCenterX']<-state.center$x
df['StateCenterY']<-state.center$y
df['StateArea']<-state.area
us <- map_data("state")
ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Area')

ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$Murder)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Murder Rate')

ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  geom_point(aes(x=df$StateCenterX,y=df$StateCenterY,size=df$population)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map() +
  ggtitle('USA Population')

nyx <- df[df$stateName=="New York",'StateCenterX']
nyy <- df[df$stateName=="New York",'StateCenterY']

ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$Murder)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map(xlim=c(nyx-10,nyx+10),ylim=c(nyy-10,nyy+10)) +
  ggtitle('North East Murder Rate')


ggplot(df,aes(map_id=tolower(stateName))) +
  geom_map(map=us,aes(fill=df$StateArea)) +
  geom_point(aes(x=df$StateCenterX,y=df$StateCenterY,size=df$population)) +
  expand_limits(x=us$long,y=us$lat) +
  coord_map(xlim=c(nyx-10,nyx+10),ylim=c(nyy-10,nyy+10)) +
  ggtitle('North East Population')

