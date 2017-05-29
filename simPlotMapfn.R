## simPlotMap function
## bm8@st-andrews.ac.uk
## 2017-05-29

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