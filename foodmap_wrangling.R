## Orkney seals model: quiver plot of foodmap
## alistair.mcconnell@gmail.com
## 2017-06-01

require(tidyverse)
require(plotly)

# converting the foodmap matrix to a data frame, only using the first foodmap.
# transposing and flipping the x-axis to reorient north to the top
food <- data.frame(t(foodmap[[4]]))
colnames(food) <- as.numeric(rev(Longitude))
food <- cbind(Latitude, food)
food <- gather(food, Longitude, Value, -Latitude)
food$Longitude <- as.numeric(rev(food$Longitude))

# quiver plot
p <-  ggplot(data = food, aes(x = Longitude, y = Latitude)) +
  geom_point(size = 0.5, colour = "red") +
  geom_spoke(aes(angle = Value), radius = 0.01) +
  coord_equal() +
  theme_bw() +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

ggsave("foodmap1.pdf", width = 594, height = 420, units = "mm")

ggplotly(p)