"psclose" <-
function(file=options("gmt.file"))
{
  if(is.list(file)) file <- unlist(file)[1]
  if(is.null(file)) stop("Please pass a valid 'file' argument, or run gmt(file=\"myfile\").")

  file.create("emptyfile")
  gmt.system("psxy emptyfile -JM -R -O", file=file, append=TRUE)  # larger file than -O in last cmd
  file.remove("emptyfile")

  invisible(NULL)
}

