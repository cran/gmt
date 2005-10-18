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
\seealso{
  \code{\link{plot.default}}, \code{\link[grDevices]{postscript}}.

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
\keyword{hplot}
% Programming
\keyword{interface}
