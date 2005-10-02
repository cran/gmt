"gmt" <-
function(par, style="s", file="map.eps", quiet=FALSE)
{
  if(!missing(par))
  {
    gmt.system(paste("gmtdefaults -D",style,sep=""), file=".gmtdefaults4")
    if(is.character(par) && nchar(par)>0)
      gmt.system(paste("gmtset",gsub("="," = ",par)))  # add extra spacing around equal signs
  }
  options(gmt.file=file)

  if(!quiet)
  {
    gmtdefaults <- gmt.system("gmtdefaults -L")
    cat(paste(gmtdefaults,collapse="\n"), "\n\n")
    print(options("gmt.file"))
  }
  invisible(options("gmt.file"))
}

