\name{psbar}
\alias{psbar}
\title{Add Bars to GMT Mercator Map}
\description{
  Call GMT to add bars to the active map and save in postscript format.
  This function does the necessary calculations to render bars in
  standard height given a Mercator-projected map. It is not intended for
  other projections.
}
\usage{
psbar(x, cmd="-JM -R -W1p -G180 -O -K", file=options("gmt.file"), ref=0,
      digits=options("digits"))
}
\arguments{
  \item{x}{data frame, matrix, or filename containing the data to be
    plotted.}
  \item{cmd}{string of arguments passed to \command{psxy}.}
  \item{file}{filename where the map is saved.}
  \item{ref}{reference latitude where Height=1 renders a bar 1 degree
    high.}
  \item{digits}{precision used when rounding the geographic
    coordinates.}
}
\details{
  The data are arranged in four columns: Lon, Lat, Width, and Height, in
  that order. See \code{help(r2gmt)} for valid data file format when
  argument \code{x} is a filename. See the GMT documentation for details
  on \command{psxy} and other GMT commands.
}
\value{
  Null, but the map is annotated and saved in postscript format.

  As a side product, a temporary file \file{lastBAR.gmt} is saved in the
  working directory.
}
\note{
  Assumes that GMT version 4 is installed, i.e. that \command{psxy} and
  other commands are in the path, and environment variable \env{GMTHOME}
  is defined.

  The derivative of the Mercator projection is used to standardize the
  bar height:
  \deqn{
    f'\!(\theta) \;=\; \frac{1}
    {2\tan\;\!\!\!\Big(\!\frac\pi4\!+\!\frac\theta2\!\Big)
      \cos^2\!\Big(\!\frac\pi4\!+\!\frac\theta2\!\Big)}
  }{
    f'(N) = 1 / (2 * tan(pi/4+N/2) * cos(pi/4+N/2)^2)
  }
  where \eqn{\theta}{N} is latitude in radians and \eqn{f(\theta)}{f(N)}
  is the y-axis coordinate. The bar height at a given latitude is
  \eqn{h\times f'(\theta_{\mathrm{ref}})/f'(\theta)}{h*f'(ref)/f'(N)},
  where \eqn{h} is the height passed by the user and
  \eqn{\theta_{\mathrm{ref}}}{ref} is a reference latitude where
  \eqn{h\!=\!1}{h=1} renders a bar 1 degree high.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\seealso{
  \code{\link{barplot}}, \code{\link[grDevices]{postscript}}.

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
