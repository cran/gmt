"pscoast" <-
function(cmd, file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  gmt.system(paste("pscoast",cmd), file=file)

  invisible(NULL)
}

