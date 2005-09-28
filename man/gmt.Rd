\name{gmt}
\alias{gmt}
\title{Initialize a GMT Session}
\description{
  Initialize a GMT (Generic Mapping Tools) session by setting graphical
  parameters and current postscript file.
}
\usage{
gmt(par, style="s", file="map.eps", quiet=FALSE)
}
\arguments{
  \item{par}{optional string of the form
    \code{"PARAMETER1=value1 PARAMETER2=value2 ..."}, passed to
    \command{gmtset}}
  \item{style}{default units and values: \code{"s"} for SI
    (international) or \code{"u"} for United States, passed to
    \command{gmtdefaults}}
  \item{file}{postscript filename used in subsequent calls to GMT plot
    functions, passed to \code{options()}}
  \item{quiet}{whether current settings should be displayed}
}
\details{
  File type should be \file{.eps} when \code{PAPER_MEDIA} is \code{A4+}
  or \code{letter+}, but \file{.ps} otherwise.

  See the GMT documentation for details on graphical parameters,
  \command{gmtdefaults}, \command{gmtset} and other GMT commands.
}
\value{
  List containing the current \code{options("gmt.file")}.

  If \code{par} is passed by user (even an empty string \code{""} will
  do), a file named \file{.gmtdefaults4} is created in the working
  directory. If \code{quiet=FALSE}, the current graphical parameter
  settings are displayed.
}
\note{
  Assumes that GMT version 4 is installed, i.e. that \command{gmtset}
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
  \code{gmt} initializes the GMT session, \code{\link{pscoast}} draws a
  map, \code{\link{psxy}}, \code{\link{pstext}}, and \code{\link{psbar}}
  annotate the map, and \code{\link{psclose}} finalizes the postscript
  file.

  \code{\link{options}} can be used directly to set
  \code{options(gmt.file="mypath")}.

  Other packages that can be used to draw maps include: \pkg{GRASS},
  \pkg{maps} and \pkg{PBSmapping}.
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
% Programming
\keyword{environment}
\keyword{interface}
