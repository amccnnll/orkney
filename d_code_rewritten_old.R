## D-code taken apart

## layout

layout(matrix(c(1,1,1,0,2,3,4), nrow = 7, ncol = 1))

## seal tracks

s1 <- simPlotMap.fn(seals)

## energy
s2 <- for (ii in 1:sim$nIndivs) {
                                 plot(sim$DT.seq, seals[[ii]]$energy / 10e6,
                                 main = paste("seal ID ", seals[[ii]]$ID), 
                                 ylab = "energy (MJ)") }

## activity  
s3 <- for (ii in 1:sim$nIndivs) {
                                 simPlotState.fn(1:sim$cylces.n,
                                 seals[[ii]]$activity, 
                                 sim$activityList, 
                                 "activity") }
  
## urge
s4 <- for (ii in 1:sim$nIndivs) {
                                 simPlotState.fn(1:sim$cylces.n,
                                 seals[[ii]]$urge, 
                                 sim$urgeList, 
                                 "urge")}









