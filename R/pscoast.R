"pscoast" <-
function(cmd, file=options("gmt.file"))
###########################################################################################################################
###                                                                                                                       #
### Function: pscoast                                                                                                     #
###                                                                                                                       #
### Purpose:  Draw GMT map                                                                                                #
###                                                                                                                       #
### Args:     cmd is the string of arguments passed to pscoast.exe                                                        #
###           file is the filename where the figure will be written in postscript format                                  #
###                                                                                                                       #
### Example:  gmt(demo.par); pscoast(demo.coast); psxy(demo.xy); pstext(demo.text); psbar(demo.bar,ref=64); psclose()     #
###                                                                                                                       #
### Returns:  NULL                                                                                                        #
###                                                                                                                       #
###########################################################################################################################
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  shell(paste("pscoast ",cmd,">",file,sep=""), invisible=TRUE)

  invisible(NULL)
}

