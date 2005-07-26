\name{psxy}
\alias{psxy}
\title{Add Lines/Symbols to GMT Map}
\description{
  Call \acronym{GMT} to add lines/symbols to a map and save in
  postscript format.
}
\usage{
psxy(x, cmd="-JM -R -Scp -W2p -O -K", file=getOption("gmt.file"))
}
\arguments{
  \item{x}{data frame, matrix, or filename containing the data to be
    plotted.}
  \item{cmd}{string of arguments passed to \command{psxy}.}
  \item{file}{filename where the map is saved.}
}
\details{
  The data are arranged in two (Lon, Lat) or more columns, depending on
  the \command{-S} argument.

  If \code{x} is a filename, the data should be tabular with or without
  a header, separated by commas or whitespace. The first line is
  interpreted as header if the first non-whitespace character is not
  minus, point, or number.

  See the \acronym{GMT} documentation for details on \command{psxy} and
  other \acronym{GMT} commands.
}
\value{
  Null, but the map is annotated and saved in postscript format.

  The temporary \acronym{GMT} input file \file{xy.gmt} is saved in
  directory \code{dirname(tempdir())}, for the user to view or edit. It
  is later removed by \code{psclose()}.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\seealso{
  Similar to \code{\link{points}}, \code{\link{lines}}, and
  \code{\link{postscript}} in native \R graphics.

  \code{\link{gmt}}, \code{\link{pscoast}}, \code{psxy},
  \code{\link{pstext}}, \code{\link{psbar}}, and \code{\link{psclose}}
  work together to draw maps.

  \code{\link{gmt-package}} gives an overview of the package.
}
\examples{
\dontrun{
# Draw map and save as "map.eps" in current working directory
gmt(demo.par)
pscoast(demo.coast)
psxy(demo.xy)
pstext(demo.text)
psbar(demo.bar, ref=66)
psclose()
# See directory gmt/example for details
}
}
% Graphics
\keyword{aplot}
% Programming
\keyword{interface}
% MASS
\keyword{spatial}
