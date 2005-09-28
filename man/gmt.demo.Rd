\name{gmt.demo}
\docType{data}
\alias{demo.par}
\alias{demo.coast}
\alias{demo.xy}
\alias{demo.text}
\alias{demo.bar}
\title{GMT Example Data}
\description{
  These five objects are provided to demonstrate the functionality of
  the \pkg{gmt} package.}
\usage{
demo.par
demo.coast
demo.xy
demo.text
demo.bar
}
\format{
  \code{demo.par} and \code{demo.coast} are simple strings.

  \code{demo.xy} is a data frame containing:
  \tabular{ll}{
    \code{Lon}\tab Longitude\cr
    \code{Lat}\tab Latitude\cr
    \code{Size}\tab Size of plot symbol\cr
  }
  \code{demo.text} is a data frame containing:
  \tabular{ll}{
    \code{Lon}\tab Longitude\cr
    \code{Lat}\tab Latitude\cr
    \code{Size}\tab Size of plot symbol\cr
    \code{Angle}\tab Angle in degrees counter-clockwise from horizontal\cr
    \code{Font}\tab Font number\cr
    \code{Justify}\tab Justification code\cr
    \code{Text}\tab Text label\cr
  }
  \code{demo.bar} is a data frame containing:
  \tabular{ll}{
    \code{Lon}\tab Longitude\cr
    \code{Lat}\tab Longitude\cr
    \code{Width}\tab Bar width in degrees\cr
    \code{Height}\tab Bar height in degrees\cr
  }
}
\details{
  See the GMT documentation for details on \command{psxy},
  \command{pstext} and other GMT commands.
}
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{
  \code{\link{psxy}}, \code{\link{pstext}}, \code{\link{psbar}}.
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
\keyword{datasets}
