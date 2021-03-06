\name{plot.gts}
\Rdversion{1.1}
\alias{plot.gts}
\title{Plot grouped or hierarchical time series}
\description{
Method for plotting grouped or hierarchical time series and their forecasts.
}
\usage{
\S3method{plot}{gts}(x, include, levels, labels = TRUE, col = NULL, color_lab = FALSE, ...)
}

\arguments{
  \item{x}{An object of class \code{\link[hts]{gts}}.}
  \item{include}{Number of values from historical time series to include in the plot of forecasted group/hierarchical time series.}  
  \item{levels}{Integer(s) or string(s) giving the specified levels(s) to be plotted}
  
  \item{labels}{If \code{TRUE}, plot the labels next to each series}
  \item{col}{Vector of colours, passed to \code{plot.ts} and to \code{lines}}
  \item{color_lab}{If \code{TRUE}, colour the direct labels to match line colours.  If \code{FALSE} will be as per \code{par()$fg}.}
  \item{\dots}{Other arguments passing to \code{\link[graphics]{plot.default}}}
}
\author{Rob J Hyndman and Earo Wang}

\seealso{\code{\link[hts]{aggts}}}

\references{
R. J. Hyndman, R. A. Ahmed, G. Athanasopoulos and H.L. Shang (2011) 
Optimal combination forecasts for hierarchical time series. 
\emph{Computational Statistics and Data Analysis}, \bold{55}(9), 2579--2589.
\url{http://robjhyndman.com/papers/hierarchical/}
}
\examples{
plot(htseg1, levels = c(0, 2))
plot(infantgts, include = 10, levels = "State")
plot(infantgts, include = 10, levels = "State", 
    col = colours()[100:107], lty = 1:8, color_lab = TRUE)
}
\keyword{hplot}

