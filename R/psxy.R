"psxy" <-
function(x, cmd="-JM -R -Scp -W2p -O -K", file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  r2gmt(x, "lastXY.gmt")
  ps <- system(paste("psxy lastXY.gmt ",cmd,sep=""), intern=TRUE, invisible=TRUE)
  pscon <- file(file, "a")  # append
  writeLines(ps, pscon)
  close.connection(pscon)

  invisible(NULL)
}

