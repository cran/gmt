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
  the \command{-S} argument. See \code{help(r2gmt)} for valid data file
  format when argument \code{x} is a filename. See the GMT documentation
  for details on \command{psxy} and other GMT commands.
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
\seealso{
  \code{\link{lines}}, \code{\link{points}},
  \code{\link[grDevices]{postscript}}.

  \code{\link{gmt-package}} gives an overview of the package.
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
