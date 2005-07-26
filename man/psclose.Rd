\name{psclose}
\alias{psclose}
\title{Finalize GMT Map}
\description{
  Call \acronym{GMT} to finalize a map and save in postscript format.
}
\usage{
psclose(file=getOption("gmt.file"), cleanup=TRUE)
}
\arguments{
  \item{file}{filename where the map is saved.}
  \item{cleanup}{whether history files \file{.gmtcommands4} and
    \file{.gmtdefaults4} should be removed, leaving no trace except the
    postscript file.}
}
\value{Null, but the map is finalized and saved in postscript format.}
\note{
  The postscript file is finalized by appending a closing trailer, and
  the bounding box declaration is moved to the header. This enables
  Ghostscript to distill a \acronym{PDF} map using the
  \command{-dEPSCrop} method.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\seealso{
  Similar to \code{\link{dev.off}} and \code{\link{postscript}} in
  native \R graphics.

  \code{\link{gmt}}, \code{\link{pscoast}}, \code{\link{psxy}},
  \code{\link{pstext}}, \code{\link{psbar}}, and \code{psclose}
  work together to draw maps.

  \code{\link{gmt-package}} gives an overview of the package.
}
\examples{
\dontrun{
# Draw map and save as "map.eps" in R working directory
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
