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
  \item{file}{filename where the map is saved}
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
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{
  \code{\link{gmt}} initializes the GMT session, \code{\link{pscoast}}
  draws a map, \code{\link{psxy}}, \code{\link{pstext}} and
  \code{\link{psbar}} annotate the map, and \code{psclose} finalizes the
  postscript file.
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
