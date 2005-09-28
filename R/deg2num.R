"deg2num" <-
function(x)
###########################################################################################################################
###                                                                                                                       #
### Function: deg2num                                                                                                     #
###                                                                                                                       #
### Purpose:  Convert deg:min:sec expression to decimal number                                                            #
###                                                                                                                       #
### Args:     x is a string vector with deg:min:sec expressions                                                           #
###                                                                                                                       #
### Notes:    See Appendix B.1.1 in the GMT manual for correct formats of deg:min:sec expressions                         #
###                                                                                                                       #
### Example:  deg2num(c("12:30:44.5W", "17.5S", "1:00:05", "200:45E"))                                                    #
###                                                                                                                       #
### Returns:  Numeric vector of same length as x, containing the converted values                                         #
###                                                                                                                       #
###########################################################################################################################
{
  is.digit <- function(x)
  {
    !is.na(as.numeric(x))
  }

  if(length(x) > 1)
    sapply(x, deg2num)  # recursive solution, to support different formats for different elements
  else
  {
    ## 1 Determine sign (positive or negative)
    first.char <- substring(x, first=1, last=1)
    if(first.char == "-")
      sign <- -1
    else if(is.digit(first.char))
      sign <- 1
    else
      stop("First character must be \"-\" or number.")

    ## 2 Look at last character: cut it off if W|E|S|N and change sign if W|S
    last.char <- substring(x, first=nchar(x), last=nchar(x))
    if(last.char=="W" || last.char=="E" || last.char=="S" || last.char=="N")
    {
      string <- substring(x, first=1, last=nchar(x)-1)
      if(last.char=="W" || last.char=="S")
        sign <- -sign
    }
    else if(is.digit(last.char))
      string <- as.character(x)
    else
      stop("Last character must be W, E, S, N, or number")

    ## 3 Split string at colons, convert to decimals, and catch split errors
    splits <- unlist(strsplit(string, ":"))
    if(length(splits)==1 && all(is.digit(splits)))
      value <- sign * abs(as.numeric(splits[1]))
    else if(length(splits)==2 && all(is.digit(splits)))
      value <- sign * (abs(as.numeric(splits[1])) + as.numeric(splits[2])/60)
    else if(length(splits)==3 && all(is.digit(splits)))
      value <- sign * (abs(as.numeric(splits[1])) + as.numeric(splits[2])/60 + as.numeric(splits[3])/3600)
    else
      stop("Unable to interpret geographic coordinates. See Appendix B.1.1 in GMT manual for correct formats.")

    return(value)
  }
}

