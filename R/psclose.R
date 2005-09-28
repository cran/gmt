"psclose" <-
function(file=options("gmt.file"))
###########################################################################################################################
###                                                                                                                       #
### Function: psclose                                                                                                     #
###                                                                                                                       #
### Purpose:  Finalize GMT postscript file by appending closing trailer                                                   #
###                                                                                                                       #
### Args:     file is the GMT postscript file that should be closed                                                       #
###                                                                                                                       #
### Notes:    Less graceful (larger file) than finalizing with -O argument in last plotting command.                      #
###                                                                                                                       #
### Example:  gmt(demo.par); pscoast(demo.coast); psxy(demo.xy); pstext(demo.text); psbar(demo.bar,ref=64); psclose()     #
###                                                                                                                       #
### Returns:  NULL                                                                                                        #
###                                                                                                                       #
###########################################################################################################################
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  file.create("emptyfile")
  shell(paste("psxy emptyfile -JM -R -O>>",file,sep=""), invisible=TRUE)
  file.remove("emptyfile")

  invisible(NULL)
}

