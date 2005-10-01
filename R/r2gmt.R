"r2gmt" <-
function(x, outfile, append=FALSE)
{
  is.digit <- function(x) suppressWarnings(!is.na(as.numeric(x)))

  ## 1  Import x if it's a file
  if(is.character(x) && file.exists(x))
  {
    first.char <- substring(scan(x,what="",n=1,quiet=TRUE), 1, 1)  # assume one-line header if first non-whitespace char
    header <- all(first.char!="-", first.char!=".", !is.digit(first.char))  # is not minus, point, or number
    sep <- if(length(grep(",",readLines(x,n=1)))>1) "," else ""  # assume comma separator if first line has comma
    x <- read.table(x, sep=sep, header=header)
  }

  ## 2  Now that x is a data object, export it
  if(append)
    write(">", outfile, append=TRUE)
  write.table(x, outfile, sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE, append=append)

  invisible(x)
}

