\name{gmt-package}
\alias{gmt-package}
\docType{package}
\title{Interface between GMT 4.0 Map-Making Software and R}
\description{
  Interface between GMT 4.0 map-making software and R, enabling the user
  to manipulate geographic data within R and call GMT programs to draw
  and annotate maps in postscript format.
}
\details{
  \emph{Initialize GMT session:}
  \tabular{ll}{
    \code{\link{gmt}} \tab set graphical parameters and postscript file
  }
  \emph{Create a map:}
  \tabular{ll}{
    \code{\link{pscoast}} \tab draw\cr
    \code{\link{psxy}}    \tab annotate\cr
    \code{\link{pstext}}  \tab annotate\cr
    \code{\link{psbar}}   \tab annotate\cr
    \code{\link{psclose}} \tab finalize
  }
  \emph{Convert and calculate:}
  \tabular{ll}{
    \code{\link{deg2num}} \tab degrees to numeric\cr
    \code{\link{geodist}} \tab distance between coordinates
  }
  \emph{Examples:}
  \tabular{ll}{
    \code{\link{demo.par}}, \code{\link{demo.coast}},
    \code{\link{demo.xy}}, \code{\link{demo.text}},
    \code{\link{demo.bar}} \tab strings and data frames that make up a
    map
  }
  \emph{Internal:}
  \tabular{ll}{
    \code{\link{gmt.system}}, \code{\link{r2gmt}} \tab not really
    intended for the end user
  }
  Additional details are found on the \code{help(package="gmt")} page.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}.}
\references{
  \cite{Wessel, P. and W.H.F. Smith. 2004. The Generic Mapping Tools:
    Technical reference and cookbook. Version 4.} Available at
  http://gmt.soest.hawaii.edu/gmt/doc/pdf/GMT\eqn{\_}{_}Docs.pdf.
}
\seealso{
  Other packages that can be used to draw maps include: \pkg{GRASS},
  \pkg{maps} and \pkg{PBSmapping}.
}
% Graphics
\keyword{hplot}
% Statistics
\keyword{ts}
