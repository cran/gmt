\name{gmt.system}
\alias{gmt.system}
\title{Invoke GMT system command}
\description{
  Invoke a system command, possibly directing the output to a file.
}
\usage{
gmt.system(cmd, file=NULL, append=FALSE)
}
\arguments{
  \item{cmd}{system command to be invoked, as a string.}
  \item{file}{filename to which output should be directed.}
  \item{append}{whether output should be appended to existing file.}
}
\value{Command output as a vector of strings.}
\note{
  This function is primarily an internal function, but users may find it
  handy for their own plotting functions. It is platform-independent,
  unlike the \code{shell} function.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\seealso{
  \code{\link{system}}, \code{\link{writeLines}}.

  \code{\link{gmt-package}} gives an overview of the package.
}
\examples{
\dontrun{
## Assuming that GMT is in path
gmt.system("gmtdefaults -Ds", file=".gmtdefaults4")
}
}
% Programming
\keyword{interface}
\keyword{file}
