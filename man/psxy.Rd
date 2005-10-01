\name{psxy}
\alias{psxy}
\title{Add Lines/Symbols to GMT Map}
\description{
  Call GMT to add lines/symbols to the active map and save in postscript
  format.
}
\usage{
psxy(x, cmd="-JM -R -Scp -W2p -O -K", file=options("gmt.file"))
}
\arguments{
  \item{x}{data frame, matrix, or filename containing the data to be
    plotted.}
  \item{cmd}{string of arguments passed to \command{psxy}.}
  \item{file}{filename where the map is saved.}
}
\details{
  The data are arranged in two (Lon, Lat) or more columns, depending on
  the \command{-S} argument. See the GMT documentation for details on
  \command{psxy} and other GMT commands.
}
\value{
  Null, but the map is annotated and saved in postscript format.

  As a side product, a temporary file \file{lastXY.gmt} is saved in the
  working directory.
}
\note{
  Assumes that GMT version 4 is installed, i.e. that \command{psxy} and
  other commands are in the path, and environment variable
  \env{GMTHOME} is defined.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{
  \code{\link{gmt}} initializes the GMT session, \code{\link{pscoast}}
  draws a map, \code{psxy}, \code{\link{pstext}} and \code{\link{psbar}}
  annotate the map, and \code{\link{psclose}} finalizes the postscript
  file.

  See \code{\link{r2gmt}} for valid data file format when argument
  \code{x} is a filename.
}
\examples{
\dontrun{
gmt(demo.par)
pscoast(demo.coast)
psxy(demo.xy)
pstext(demo.text)
psbar(demo.bar, ref=64)
psclose()
}
}
% Graphics
\keyword{aplot}
% Programming
\keyword{interface}
