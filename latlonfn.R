## lat lon conversions
## bm8@st-andrews.ac.uk
## 2017-05-29

y2lat <- function(xx) {
  return(58.6 + 0.00807 * xx)
}

x2lon <- function(xx) {
  return(-4.1 + 0.01513 * xx)
}