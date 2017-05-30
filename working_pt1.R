## orkney seals main plot
## am
## 2017-05-30

# converting the orkney matrix to a 1D dataframe
orkney.df <- data.frame(t(orkney))
colnames(orkney.df) <- as.numeric(rev(Longitude))
orkney.df <- cbind(Latitude, orkney.df)
orkney.v <- gather(orkney.df, Longitude, Value, -Latitude)
orkney.v$Longitude <- as.numeric(rev(orkney.v$Longitude))

# main plot
seals.main <- ggplot(orkney.v, aes(x = Longitude, y = Latitude, fill = Value)) +
              geom_raster() +
              theme_bw() +
              coord_cartesian() +
              scale_x_continuous(expand = c(0,0)) +
              scale_y_continuous(expand = c(0,0))

seals.main