reoriented.orkney <- t(orkney)
orkney.df <- data.frame(reoriented.orkney)
colnames(orkney.df) <- as.numeric(rev(Longitude))
orkney.df <- cbind(Latitude, orkney.df)

orkney.v <- gather(orkney.df, Longitude, Value, -Latitude)
orkney.v$Longitude <- as.numeric(rev(orkney.v$Longitude))

mstr <- ggplot(orkney.v, aes(x = Longitude, y = Latitude, fill = Value)) +
  geom_tile() +
  theme_bw() +
  coord_cartesian() +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

mstr