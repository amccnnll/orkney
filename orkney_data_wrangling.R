## Orkney seals model: data manipulation
## alistair.mcconnell@gmail.com
## 2017-05-30

# converting the orkney matrix to a data frame
orkney.df <- data.frame(t(orkney))
colnames(orkney.df) <- as.numeric(rev(Longitude))
orkney.df <- cbind(Latitude, orkney.df)
orkney.df <- gather(orkney.df, Longitude, Value, -Latitude)
orkney.df$Longitude <- as.numeric(rev(orkney.v$Longitude))

# converting seals output to data frame
# NOTE: superceded by routine within plotting for loop

#seals.df <- data.frame(seals)
#levels(seals.df$activity) <- sim$activityList
#seals.df$lon <- as.numeric(x2lon(seals.df$x))
#seals.df$lat <- as.numeric(y2lat(seals.df$y))
#seals.df$datetime <-sim$DT.seq

# converting patch and haulout to data frames
patch <- data.frame(patch.pts)
haul <- data.frame(haul.latlong)