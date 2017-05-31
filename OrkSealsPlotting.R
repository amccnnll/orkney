## Orkney seals model
## Plotting script
## alistair.mcconnell@gmail.com
## 2017-05-31

# requisite packages:

library(ggplot2)
library(gridExtra)
library(viridis)

# requires the following inputs loaded to the global envionrment:
#
# sim (list of simulation params)
# seals (list output of model)
# orkney (matrix raster or environment)
# haul.latlong (haulout locations)
# patch.pts (patch locations)
# x2lon (function)
# y2lat (function)

# PREPARATION
# run the data wranlging script
# orkney_data_wranlgling.R
# this will load a number of othher data frames to the global environment
# this script DOES NOT remove these data from the global environment when finished

# PLOTTING

# set the number of animals the data by animal ID
animals = unique(1:sim$nIndivs)

# for loop to run through each animal ID and print plots
for (i in 1:length(animals)) {
  seals.data = as.data.frame(seals[animals[i]])
  levels(seals.data$activity) <- sim$activityList
  seals.data$lon <- as.numeric(x2lon(seals.df$x))
  seals.data$lat <- as.numeric(y2lat(seals.df$y))
  seals.data$datetime <- sim$DT.seq

# plot1
plot1 <- ggplot(orkney.df, aes(x = Longitude,
                               y = Latitude)) +
  geom_tile(data = orkney.df, aes(fill = as.factor(Value))) +
  scale_fill_manual(values = c("white", "grey", "white", "grey")) +
  geom_path(data = seals.data,
            aes(x = lon, y = lat, colour = as.numeric(energy)),
            arrow = arrow(angle = 30,
                          length = unit(0.1, "cm"),
                          ends = "last", type = "open")) +
  scale_colour_viridis(option = "C") +
  theme_bw() +
  ggtitle(paste("seal ID ", seals[[i]]$ID)) + 
  theme(plot.title = element_text(lineheight=.8, face="bold")) +
  geom_point(data = patch,
             aes(x = x, y = y),
             shape = 24,
             color = "red",
             fill = "red",
             size = 1) +
  geom_point(data = haul,
             aes(x = X1, y =X2),
             shape = 72,
             size = 3) +
  theme(legend.position = "none") +
  coord_equal() +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

# plot2
plot2 <- ggplot(seals.data, aes(x = datetime, y = energy)) +
  geom_point() +
  theme_bw() +
  scale_x_datetime(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0))

# plot 3
plot3 <- ggplot(seals.df, aes(x = datetime, y = activity)) +
  geom_step(group = 1, colour = "blue") +
  scale_x_datetime(expand = c(0,0)) +
  scale_y_discrete(expand = c(0.1,0.1)) +
  theme_bw()

# initialize PDF (you can adjust height and width in the pdf() call
pdf(file = sprintf("animal_%s.pdf", animals[i]),   paper = "a4")

# print plots to device
# note - increase nrow if you add more plots!
print(gridExtra::grid.arrange(plot1, plot2, plot3,
                              nrow = 3,
                              heights = c(3,1,1)))

# close device
dev.off()
}