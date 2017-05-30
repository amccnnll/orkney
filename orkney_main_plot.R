## orkney seals main plot
## am
## 2017-05-30

# main plot
seals.main <- ggplot(orkney.v, aes(x = Longitude,
                                   y = Latitude)) +
  geom_tile(data = orkney.v, aes(fill = as.factor(Value))) +
  scale_fill_manual(values = c("white", "green", "red", "grey")) +
  geom_path(data = sealsb,
            aes(x = lon, y = lat, colour = as.numeric(datetime)),
            arrow = arrow(angle = 30,
                          length = unit(0.1, "cm"),
                          ends = "last", type = "open")) +
  scale_colour_viridis(option = "C") +
  geom_point(data = patch,
             aes(x = x, y = y),
             shape = 24,
             color = "red",
             fill = "red",
             size = 4) +
  geom_point(data = haul,
             aes(x = V1, y =V2),
             shape = 72,
             size = 4) +
  theme_bw() +
  theme(legend.position = "none") +
  coord_equal() +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

seals.main
