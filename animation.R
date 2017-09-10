## Animation
## alistair.mcconnell@gmail.com
## 2017-09-10

sealtrack <- ggplot(seals.data, aes(x, y, frame = datetime)) + geom_point(aes(cumulative = T, group = ID))

gganimate(sealtrack)