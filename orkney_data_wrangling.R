## orkney seals data manipulation
## am
## 2017-05-30

# converting the orkney matrix to a 1D dataframe
orkney.df <- data.frame(t(orkney))
colnames(orkney.df) <- as.numeric(rev(Longitude))
orkney.df <- cbind(Latitude, orkney.df)
orkney.v <- gather(orkney.df, Longitude, Value, -Latitude)
orkney.v$Longitude <- as.numeric(rev(orkney.v$Longitude))

# converting seals output to dataframe
sealsb <- as.data.frame(seals)
sealsb$lon <- as.numeric(x2lon(sealsb$x))
sealsb$lat <- as.numeric(y2lat(sealsb$y))
sealsb$datetime <- seq(ISOdatetime(2017,05,30,0,0,0, tz = "UTC"), by = "2 hours", length.out = 50)

# converting patch and haulout to dataframes
patch <- as.data.frame(patch.pts)
haul <- as.data.frame(haul.latlong)