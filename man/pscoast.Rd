\name{pscoast}
\alias{pscoast}
\title{Draw GMT Map}
\description{
  Call GMT to draw a map (coastlines, borders, rivers) and save in
  postscript format.
}
\usage{
pscoast(cmd, file=options("gmt.file"))
}
\arguments{
  \item{cmd}{string of arguments passed to \command{pscoast}.}
  \item{file}{filename where the map will be saved.}
}
\details{
  File type should be \file{.eps} when \code{PAPER_MEDIA} is \code{A4+}
  or \code{letter+}, but \file{.ps} otherwise.

  See the GMT documentation for details on \command{pscoast} and other
  GMT commands.
}
\value{Null, but a map is drawn and saved in postscript format.}
\note{
  Assumes that GMT version 4 is installed, i.e. that \command{pscoast}
  and other commands are in the path, and environment variable
  \env{GMTHOME} is defined.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{
  \code{\link{gmt}} initializes the GMT session, \code{pscoast} draws a
  map, \code{\link{psxy}}, \code{\link{pstext}}, and \code{\link{psbar}}
  annotate the map, and \code{\link{psclose}} finalizes the postscript
  file.
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
\keyword{hplot}
% Programming
\keyword{interface}
