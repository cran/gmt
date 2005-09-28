"psxy" <-
function(x, cmd="-JM -R -Scp -W2p -O -K", file=options("gmt.file"))
###########################################################################################################################
###                                                                                                                       #
### Function: psxy                                                                                                        #
###                                                                                                                       #
### Purpose:  Add lines or symbols to GMT map                                                                             #
###                                                                                                                       #
### Args:     x is the filename/matrix/data frame containing the data to be plotted                                       #
###           cmd is the string of arguments passed to psxy.exe                                                           #
###           file is an existing postscript file to which lines or symbols will be added                                 #
###                                                                                                                       #
### Notes:    Data columns: [  Lon  |  Lat  ]          if using "-Sc10p" where -A is needed to draw straight lines        #
###                         [  Lon  |  Lat  |  Size  ] if using "-Scp"                                                    #
###                         [  Lon  |  Lat  |  Type  ] if using "-S10p"  where Type is a character                        #
###                                                                                                                       #
### Example:  gmt(demo.par); pscoast(demo.coast); psxy(demo.xy); pstext(demo.text); psbar(demo.bar,ref=64); psclose()     #
###                                                                                                                       #
### Returns:  NULL                                                                                                        #
###                                                                                                                       #
###########################################################################################################################
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  r2gmt(x, "lastXY.gmt")
  shell(paste("psxy lastXY.gmt ",cmd,">>",file,sep=""), invisible=TRUE)

  invisible(NULL)
}

