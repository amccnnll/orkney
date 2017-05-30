## orkney seals main plot
## am
## 2017-05-30

# main plot
seals.main <- ggplot(orkney.v, aes(x = Longitude,
                                   y = Latitude)) +
  geom_tile(data = orkney.v, aes(fill = as.factor(Value))) +
  scale_fill_manual(values = c("white", "grey", "white", "grey")) +
  geom_path(data = seals.df,
            aes(x = lon, y = lat, colour = as.numeric(energy)),
            arrow = arrow(angle = 30,
                          length = unit(0.1, "cm"),
                          ends = "last", type = "open")) +
  scale_colour_viridis(option = "C") +
  theme_bw() +
  geom_point(data = patch,
             aes(x = x, y = y),
             shape = 24,
             color = "red",
             fill = "red",
             size = 1) +
  geom_point(data = haul,
             aes(x = V1, y =V2),
             shape = 72,
             size = 3) +
  theme(legend.position = "none") +
  coord_cartesian() +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

# points
# change r2w and g2gr
geom_point(data = patch,
           aes(x = x, y = y),
           shape = 24,
           color = "red",
           fill = "red",
           size = 1) +
  geom_point(data = haul,
             aes(x = V1, y =V2),
             shape = 72,
             size = 3)
# energy plot
seals.energy <- ggplot(seals.df, aes(x = datetime, y = energy)) +
                geom_point() +
                theme_bw() +
                scale_x_datetime(expand = c(0,0)) +
                scale_y_continuous(expand = c(0,0))

# activity plot
seals.activity <- ggplot(seals.df, aes(x = datetime, y = activity)) +
                  geom_point(colour = "blue") +
                  scale_x_datetime(expand = c(0,0)) +
                  scale_y_discrete(expand = c(0.1,0.1),
                                   break = c(as)) +
                  theme_bw()