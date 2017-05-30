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
sealsb$lon <- as.numeric(x2lon(sealsb$x))
sealsb$lat <- as.numeric(y2lat(sealsb$y))
sealsb$datetime <- seq(ISOdatetime(2017,05,30,0,0,0, tz = "UTC"), by = "2 hours", length.out = 50)

# main plot
seals.main <- ggplot(orkney.v, aes(x = Longitude,
                                   y = Latitude)) +
              geom_tile(data = orkney.v, aes(fill = as.factor(Value))) +
              scale_fill_manual(values = c("white", "red", "green", "grey")) +
              geom_path(data = sealsb,
                        aes(x = lon, y = lat, colour = as.numeric(datetime)),
                        arrow = arrow(angle = 30,
                                      length = unit(0.1, "cm"),
                                      ends = "last", type = "open")) +
              scale_colour_viridis(option = "C") +
              theme_bw() +
              theme(legend.position = "none") +
              coord_equal() +
              scale_x_continuous(expand = c(0,0)) +
              scale_y_continuous(expand = c(0,0))

seals.main
