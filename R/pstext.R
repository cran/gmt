"pstext" <-
function(x, cmd="-JM -R -O -K", file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  r2gmt(x, "lastTEXT.gmt")
  ps <- system(paste("pstext lastTEXT.gmt ",cmd,sep=""), intern=TRUE, invisible=TRUE)
  pscon <- file(file, "a")  # append
  writeLines(ps, pscon)
  close.connection(pscon)

  invisible(NULL)
}

