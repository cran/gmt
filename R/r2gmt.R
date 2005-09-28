"r2gmt" <-
function(x, outfile, append=FALSE)
###########################################################################################################################
###                                                                                                                       #
### Function: r2gmt                                                                                                       #
###                                                                                                                       #
### Purpose:  Prepare data for GMT                                                                                        #
###                                                                                                                       #
### Args:     x is a matrix, data frame, or a file containing input data in columns                                       #
###           outfile is where data will be written in GMT format, tab-separated without header                           #
###           append is whether data should be appended to existing file, separating segments with ">" lines              #
###                                                                                                                       #
### Notes:    Unknown attributes that are taken care of: (1) header vs. no header, (2) comma separators vs. white space   #
###           Designed as helping function for GMT plotting in R                                                          #
###                                                                                                                       #
### Warning:  First line is interpreted as header if the first non-whitespace character is not minus, point, or number    #
###                                                                                                                       #
### Returns:  Invisible data frame that was written to outfile                                                            #
###                                                                                                                       #
###########################################################################################################################
{
  is.digit <- function(x) suppressWarnings(!is.na(as.numeric(x)))

  ## 1  Import x if it's a file
  if(is.character(x) && file.exists(x))
  {
    ## Assume one-line header if first non-whitespace char is not minus, point, or number
    first.char <- substring(scan(x,what="",n=1,quiet=TRUE), 1, 1)
    header <- all(first.char!="-", first.char!=".", !is.digit(first.char))
    ## Assume comma separator if first line has comma
    sep <- if(length(grep(",",readLines(x,n=1)))>1) "," else ""
    x <- read.table(x, sep=sep, header=header)
  }
  ## 2  Now that x is a data object, export it
  if(append)
    write(">", outfile, append=TRUE)
  write.table(x, outfile, sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE, append=append)

  invisible(x)
}

