library(sp)
library(rgdal)

#Function
LongLatToUTM<-function(x,y,zone){
        xy <- data.frame(ID = 1:length(x), X = x, Y = y)
        coordinates(xy) <- c("X", "Y")
        proj4string(xy) <- CRS("+proj=longlat +datum=WGS84")  ## for example
        res <- spTransform(xy, CRS(paste("+proj=utm +zone=",zone," ellps=WGS84",sep='')))
        return(as.data.frame(res))
}

# Example
xy <- read.csv('IOP9-lat-long.csv')
res <- LongLatToUTM(xy[,2], xy[,1], 14)
write.csv(res, 'IOP9-lat-long.utm.csv')
