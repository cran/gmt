"gmt" <-
function(par, style="s", file="map.eps", quiet=FALSE)
{
  if(!missing(par))
  {
    defaults <- system(paste("gmtdefaults -D",style,sep=""), intern=TRUE, invisible=TRUE)
    writeLines(defaults, ".gmtdefaults4")
    if(is.character(par) && nchar(par)>0)
      system(paste("gmtset",gsub("="," = ",par)), invisible=TRUE)  # add extra spacing around equal signs
  }
  options(gmt.file=file)

  if(!quiet)
  {
    gmtdefaults <- system(paste("gmtdefaults -L"), intern=TRUE, invisible=TRUE)
    cat(paste(gmtdefaults,collapse="\n"),"\n\n")
    print(options("gmt.file"))
  }
  invisible(options("gmt.file"))
}

