"gmt" <-
function(par, style="s", file="map.eps", quiet=FALSE)
###########################################################################################################################
###                                                                                                                       #
### Function: gmt                                                                                                         #
###                                                                                                                       #
### Purpose:  Set GMT options, within R and in local .gmtdefaults4 file                                                   #
###                                                                                                                       #
### Args:     par is a string of the form "PARAMETER1=value1 PARAMETER2=value2 ...", passed to gmtset                     #
###           style determines the default units and values: "s" for SI (international) or "u" for United States, passed  #
###             to gmtdefaults                                                                                            #
###           file is a postscript filename used in subsequent calls to GMT plot functions, passed to options()           #
###           quiet is whether current settings should be displayed                                                       #
###                                                                                                                       #
### Notes:    If par is passed, the function creates a local .gmtdefaults4 file in the working directory (empty string to #
###             create a local .gmtdefaults4 file with default parameter values)                                          #
###           File type should be .eps when PAPER_MEDIA is A4+ or letter+, but .ps otherwise                              #
###                                                                                                                       #
### Requires: gmt                                                                                                         #
###                                                                                                                       #
### Example:  gmt(demo.par); pscoast(demo.coast); psxy(demo.xy); pstext(demo.text); psbar(demo.bar,ref=64); psclose()     #
###                                                                                                                       #
### Returns:  List containing the current options("gmt.file") and displays the current gmtdefaults parameter settings     #
###                                                                                                                       #
###########################################################################################################################
{
  if(!missing(par))
  {
    shell(paste("gmtdefaults -D",style,">.gmtdefaults4",sep=""), invisible=TRUE)
    if(is.character(par) && nchar(par)>0)
      shell(paste("gmtset",gsub("="," = ",par)), invisible=TRUE)  # add extra spacing around equal signs
  }
  options(gmt.file=file)

  if(!quiet)
  {
    gmtdefaults <- shell(paste("gmtdefaults -L"), intern=TRUE, invisible=TRUE)
    cat(paste(gmtdefaults,collapse="\n"),"\n\n")
    print(options("gmt.file"))
  }
  invisible(options("gmt.file"))
}

