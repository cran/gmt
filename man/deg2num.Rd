\name{deg2num}
\alias{deg2num}
\title{Convert Degrees to Number}
\description{Convert deg:min:sec string to decimal number.}
\usage{
deg2num(x)
}
\arguments{\item{x}{string or vector of strings.}}
\details{
  Degrees, minutes and seconds are separated by colons, and each can
  have a decimal point as well. First character must be a minus sign or
  number, and last character must be W, E, S, N, or number.
}
\value{Numeric representation of the degree string(s).}
\note{
  The string format is adopted from Appendix B.1.1 in the GMT manual.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{\code{\link{as.numeric}} converts some strings to numbers.}
\examples{
deg2num(c("12:30:44.5W", "17.5S", "1:00:05", "200:45E"))
}
% Basics
\keyword{classes}
\keyword{character}
% Mathematics
\keyword{arith}
