"psclose" <-
function(file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  file.create("emptyfile")
  ps <- system(paste("psxy emptyfile -JM -R -O",sep=""), intern=TRUE, invisible=TRUE)  # larger file than -O in last cmd
  file.remove("emptyfile")
  pscon <- file(file, "a")  # append
  writeLines(ps, pscon)
  close.connection(pscon)

  invisible(NULL)
}

