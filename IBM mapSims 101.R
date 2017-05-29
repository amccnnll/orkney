pdf.out <- F
##dev.off()

## function definitions start ------------------------------------------------------------------
simPlotMap.fn <- function(xx) {

  image(Longitude, Latitude, orkney,
        col = c("cyan","blue", rep("red", 97), "white"))
  points(patch.pts,    col = "red", pch = 2)
  points(haul.latlong, col = "black",      pch = "Hf", cex = 1.0)
  
  
  for (ii in 1:(sim$nIndivs)) {
    lines (x2lon(xx[[ii]]$x), y2lat(xx[[ii]]$y))
  }
  
  #for (ii in 1:(sim$cylces.n - 1)) {
  #    arrows (x$x[ii], x$y[ii], x$x[ii + 1], x$y[ii + 1])
  #    lines  (x$x[ii], x$y[ii], x$x[ii + 1], x$y[ii + 1])
  #    points (x$x[ii], x$y[ii])
  #  }
}


simPlotState.fn <- function(xx, yy, yy.levels.ch, yy.lab) {
  yy.ord        <- factor(yy, levels = yy.levels.ch, ordered = T)
  yy.levels.n   <- length(yy.levels.ch)
  
  plot.default(xx, yy.ord, type = "s", yaxt = "n", lwd = 2, col = "blue",
               ylab = yy.lab, ylim = c(1, yy.levels.n),
               panel.first = abline(h = 1:yy.levels.n, col = "grey"))
  
  axis(2, at     = 1:length(yy.levels.ch), 
          labels = yy.levels.ch, las = 2, cex = 2 )
}

y2lat <- function(xx) {
  return(58.6 + 0.00807 * xx)
}


x2lon <- function(xx) {
  return(-4.1 + 0.01513 * xx)
}


## function definitions end  --------------------------------------------------------------------

simPlotMap.fn(seals)

oldPar <- par(no.readonly = T)
if (pdf.out) pdf(file = "simPlot 100.pdf", paper = "a4")

par(mfcol = c(4, 1), mar = c(3, 5, 2, 1))
for (ii in 1:sim$nIndivs) {

  plot(sim$DT.seq, seals[[ii]]$energy / 10e6,                          ## energy
        main = paste("seal ID ", seals[[ii]]$ID), 
        ylab = "energy (MJ)")
  
  simPlotState.fn(1:sim$cylces.n,                                      ## activity
                  seals[[ii]]$activity, 
                  sim$activityList, 
                  "activity")
  
  simPlotState.fn(1:sim$cylces.n,                                      ## activity
                  seals[[ii]]$urge, 
                  sim$urgeList, 
                  "urge")
  ##if (pdf.out) while (!par('page')) plot.new()
  
}
if (pdf.out) dev.off()
par(oldPar)



## ----------------------


## 












