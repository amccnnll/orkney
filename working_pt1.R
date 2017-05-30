## orkney seals main plot
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
sealsb$lon <- x2lon(sealsb$x)
sealsb$lat <- y2lat(sealsb$y)


# main plot
seals.main <- ggplot(orkney.v, aes(x = Longitude,
                                   y = Latitude)) +
              geom_tile(data = orkney.v, aes(fill = as.factor(Value))) +
              scale_fill_manual(values = c("white", "red", "green", "grey")) +
              geom_path(data = sealsb, aes(x = lon, y = lat)) +
              guides(fill = F) +
              coord_equal() +
              scale_x_continuous(expand = c(0,0)) +
              scale_y_continuous(expand = c(0,0))

seals.main
