"pscoast" <-
function(cmd, file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  ps <- system(paste("pscoast ",cmd,sep=""), intern=TRUE, invisible=TRUE)
  writeLines(ps, file)  # not append

  invisible(NULL)
}

