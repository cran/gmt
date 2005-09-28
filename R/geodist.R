"geodist" <-
function(Nfrom, Efrom, Nto, Eto, units="km")
###########################################################################################################################
###                                                                                                                       #
### Function: geodist                                                                                                     #
###                                                                                                                       #
### Purpose:  Calculate surface distance between geographic coordinates                                                   #
###                                                                                                                       #
### Args:     Nfrom is latitude of origin                                                                                 #
###           Efrom is longitude of origin                                                                                #
###           Nto is latitude of destination                                                                              #
###           Eto is longitude of destination                                                                             #
###           units is how distance is measured ("km"=kilometres, "nm"=nautical miles)                                    #
###                                                                                                                       #
### Notes:    Latitude and longitude are expressed in decimal degrees: e.g. 66.5 for 66°30' N                             #
###                                                                                                                       #
### Returns:  Vector of distances                                                                                         #
###                                                                                                                       #
###########################################################################################################################
{
  units <- match.arg(units, c("km","nm"))

  rad <- 180 / pi

  N1 <- Nfrom / rad
  E1 <- Efrom / rad
  N2 <- Nto   / rad
  E2 <- Eto   / rad

  duplicates <- N1==N2 & E1==E2
  N1[duplicates] <- 0            # When origin and destination are the same,
  E1[duplicates] <- 0            #  set them both to 0, 0
  N2[duplicates] <- 0            # Without this, geodist(48.535, 48.535, 124, 124) returns NaN,
  E2[duplicates] <- 0            #   but geodist(0, 0, 0, 0) seems to return 0 on all machines

  radians <- acos(sin(N1)*sin(N2)+cos(N1)*cos(N2)*cos(E1-E2))

  if(units == "km")
    distance <- 60 * rad * radians * 1.852
  else
    distance <- 60 * rad * radians

  return(distance)
}

