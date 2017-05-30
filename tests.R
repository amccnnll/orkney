## seals
## alistair.mcconnell@gmail.com
## 2017-05-29

## convert orkney matrix to raster
## step 1: rotate matirx 90 deg anticlockwise
reoriented.orkney <- apply(t(orkney),2,rev)
orkney.df <- data.frame(reoriented.orkney)
rownames(orkney.df) <- as.numeric(Latitude)
colnames(orkney.df) <- as.numeric(Longitude)
orkney.df <- cbind(Latitude, orkney.df)


orkney.v <- gather(orkney.df, Longitude, Value, -Latitude)

mstr <- ggplot(orkney.v, aes(x = Longitude, y = Latitude, fill = Value)) +
  geom_raster() +
  scale_y_reverse() +
  coord_cartesian() +
  theme_bw()
mstr

## set origin


## step 3: convert to raster
rast_orkney <- raster(reoriented_orkney)
#rast_orkney <- raster(reoriented_orkney,  xmn + -4.10, xmx = -1.80, ymn = 58.60, ymx = 59.83)



ggplot(SealsData, aes(Latitude, Longitude))+ theme_bw() + geom_a




library(maps)
library(mapdata)
library(ggmap)


rorkney <- raster(orkney)

ggplot(orkney.df, aes()) + geom_tile(data = orkney.df, aes(fill = factor(value)))