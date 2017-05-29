## simPlotState function
## bm8@st-andrews.ac.uk
## 2017-05-29

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