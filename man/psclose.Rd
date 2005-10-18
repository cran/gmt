\name{psclose}
\alias{psclose}
\title{Finalize GMT Map}
\description{
  Call GMT to finalize the active map by appending a closing trailer and
  save in postscript format.
}
\usage{
psclose(file=options("gmt.file"))
}
\arguments{
  \item{file}{filename where the map is saved.}
}
\details{
  See the GMT documentation for details on \command{psxy} and other GMT
  commands.
}
\value{Null, but the map is finalized and saved in postscript format.}
\note{
  Assumes that GMT version 4 is installed, i.e. that \command{psxy} and
  other commands are in the path, and environment variable \env{GMTHOME}
  is defined.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\seealso{
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
