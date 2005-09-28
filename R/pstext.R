"pstext" <-
function(x, cmd="-JM -R -O -K", file=options("gmt.file"))
###########################################################################################################################
###                                                                                                                       #
### Function: pstext                                                                                                      #
###                                                                                                                       #
### Purpose:  Add labels to GMT map                                                                                       #
###                                                                                                                       #
### Args:     x is the filename/matrix/data frame containing the data to be plotted                                       #
###           cmd is the string of arguments passed to pstext                                                             #
###           filename is where figure will be written in postscript format                                               #
###                                                                                                                       #
### Notes:    Data format: [  Lon  |  Lat  |  Size  |  Angle  |  Font  |  Justify  |  Text  ]                             #
###                                                                                                                       #
###           Font types 0-38 are listed on p. 90 in the manual                                                           #
###           Apart from AvantGarde and Japanese: 0 -  3 = Helvetica (plain, bold, italic, bold+italic)                   #
###                                               4 -  7 = Times                                                          #
###                                               8 - 11 = Courier                                                        #
###                                              12 - 12 = Symbol (Times-like)                                            #
###                                              17 - 20 = Bookman (bold, bold+italic, plain, italic)                     #
###                                              21 - 24 = Helvetica narrow                                               #
###                                              25 - 28 = New Century Schoolbook                                         #
###                                              29 - 32 = Palatino                                                       #
###                                              33 - 33 = Zapf Chancery (calligraphic)                                   #
###                                              34 - 34 = Zapf Dingbats (plotting symbols)                               #
###                                                                                                                       #
###           Justify is a string of two characters, [T|M|B] and [L|C|R] for top/middle/bottom and left/center/right      #
###                                                                                                                       #
###           Text can contain \special characters (p. 87-89 in the manual) as well as escape sequences:                  #
###           @~ toggles symbol font, @%t% switches to font type, @- and @+ for sub-/superscript, and @! to overlay two   #
###                                                                                                                       #
### Warning:  Unlike psxy.exe, pstext.exe cannot parse CSV data, so columns must be separated with white space            #
###           This error is caught and fixed by file2gmt()                                                                #
###                                                                                                                       #
### Example:  gmt(demo.par); pscoast(demo.coast); psxy(demo.xy); pstext(demo.text); psbar(demo.bar,ref=64); psclose()     #
###                                                                                                                       #
### Returns:  NULL                                                                                                        #
###                                                                                                                       #
###########################################################################################################################
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  r2gmt(x, "lastTEXT.gmt")
  shell(paste("pstext lastTEXT.gmt ",cmd,">>",file,sep=""), invisible=TRUE)

  invisible(NULL)
}

