"psbar" <-
function(x, cmd="-JM -R -W1p -G180 -O -K", file=options("gmt.file"), ref=0, digits=options("digits"))
{
  write.each.bar <- function(bar.row)
  {
    left   <- bar.row[1]  #  2----3
    right  <- bar.row[2]  #  |    |
    bottom <- bar.row[3]  #  |    |
    top    <- bar.row[4]  # 1+5---4
    bar.corners <- rbind(c(left,bottom), c(left,top), c(right,top), c(right,bottom), c(left,bottom))
    r2gmt(bar.corners, "lastBAR.gmt", append=TRUE)
  }

  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")
  if(is.list(digits)) digits <- unlist(digits)[1]

  ## 1 Parse user data and define directories
  x.matrix <- as.matrix(r2gmt(x,"lastBAR.gmt"))
  lon <- deg2num(x.matrix[,1])   # longitude at bar center
  lat <- deg2num(x.matrix[,2])   # latitude at bar base
  w   <- x.matrix[,3]            # bar width in degrees
  h   <- x.matrix[,4]            # bar height in user units (1 degree high at ref°N/S)
  n   <- nrow(x.matrix)          # number of bars

  ##   Y = log(tan(pi/4+LAT*pi/360))
  ##   LAT = (atan(exp(Y))-pi/4) / (pi/360)
  ##   Y'(LAT) = (pi/360) / (tan(pi/4+LAT*pi/360)*cos(pi/4+LAT*pi/360)^2)

  ##   LAT      0°     10°    20°    30°    40°    50°    60°    70°    80°    90°
  ##   Y        0.000  0.175  0.356  0.549  0.763  1.011  1.317  1.735  2.436  37.332
  ##   Y'(LAT)  0.017  0.018  0.019  0.020  0.023  0.027  0.035  0.051  0.101  Inf

  ## 2 Create bar.frame containing coordinates
  dYlat <- (pi/360) / (tan(pi/4+lat*pi/360)*cos(pi/4+lat*pi/360)^2)  # derivative of Mercator Y at each latitude
  dYref <- (pi/360) / (tan(pi/4+ref*pi/360)*cos(pi/4+ref*pi/360)^2)  # derivative of Mercator Y at ref°N/S
  h.deg <- h * round(dYref/dYlat, digits)                            # bar height in degrees
  left      <- lon - w/2                                             # left bar edge
  right     <- lon + w/2                                             # right bar edge
  bottom    <- lat                                                   # bottom bar edge
  top       <- lat + h.deg                                           # top bar edge
  bar.frame <- data.frame(left=left, right=right, bottom=bottom, top=top)

  ## 3 Write bar coordinates into multiple segment file and add bars to map
  file.create("lastBAR.gmt")
  apply(bar.frame, 1, write.each.bar)
  safe.cmd <- paste(cmd, "-A -M")  # ensure lines are straight and multiple-file is expected
  gmt.system(paste("psxy lastBAR.gmt",safe.cmd), file=file, append=TRUE)

  invisible(NULL)
}

