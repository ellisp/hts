\name{MinT}
\Rdversion{1.1}
\alias{MinT}
\title{Trace minimization for hierarchical or grouped time series}
\description{
Using the method of Wickramasuriya et al. (2015), this function combines the forecasts at all levels of a hierarchical or grouped time series. The \code{\link{forecast.gts}} calls this function when the \code{MinT} method is selected. 
}
\usage{
  MinT(fcasts, nodes, groups, residual, covariance = c("shr", "sam"),
       algorithms = c("lu", "cg", "chol"), keep = c("gts", "all", "bottom")) 
}
\arguments{
  \item{fcasts}{Matrix of forecasts for all levels of a hierarchical or grouped time series. Each row represents one forecast horizon and each column represents one time series of aggregated or disaggregated forecasts.}
  \item{nodes}{If the object class is hts, a list contains the number of child nodes referring to hts.}
  \item{groups}{If the object is gts, a gmatrix is required, which is the same as groups in the function gts.}
  \item{residual}{Matrix of insample residuals for all the aggregated and disaggregated time series. The columns must be in the same order as \code{fcasts}.}
  \item{covariance}{Type of the covariance matrix to be used. Shrinking towards a diagonal unequal variances ("shr") or sample covariance matrix ("sam").}
  \item{algorithms}{Algorithm used to compute inverse of the matrices.}
  \item{keep}{Return a gts object or the reconciled forecasts at the bottom level.}
}
\value{Return the reconciled \code{gts} object or forecasts at the bottom level.}

\references{
  Wickramasuriya, S. L., Athanasopoulos, G., & Hyndman, R. J. (2015). 
  Forecasting hierarchical and grouped time series through trace minimization. 
  \emph{Working paper 15/15, Department of Econometrics & Business Statistics, Monash University.}
  \url{http://robjhyndman.com/working-papers/mint/}
  
Hyndman, R. J., Lee, A., & Wang, E. (2015). 
Fast computation of reconciled forecasts for hierarchical and grouped time series. 
\emph{Computational Statistics and Data Analysis}, \bold{97}, 16--32.
\url{http://robjhyndman.com/papers/hgts/}
}

\author{Shanika L Wickramasuriya}

\seealso{
  \code{\link[hts]{hts}}, \code{\link[hts]{gts}}, \code{\link[hts]{forecast.gts}}, \code{\link[hts]{combinef}}
}
\keyword{ts}

\examples{
# hts example
\dontrun{h <- 12 
ally <- aggts(htseg1)
n <- nrow(ally)
p <- ncol(ally)
allf <- matrix(NA, nrow = h, ncol = p)
res <- matrix(NA, nrow = n, ncol = p)
for(i in 1:p)
{
  fit <- auto.arima(ally[, i])
  allf[, i] <- forecast(fit, h = h)$mean
  res[, i] <- na.omit(ally[, i] - fitted(fit))
}
allf <- ts(allf, start = 51)
y.f <- MinT(allf, htseg1$nodes, residual = res, covariance = "shr", keep = "gts", algorithms = "lu")
plot(y.f)}
  
# gts example
\dontrun{abc <- ts(5 + matrix(sort(rnorm(200)), ncol = 4, nrow = 50))
g <- rbind(c(1,1,2,2), c(1,2,1,2))
y <- gts(abc, groups = g)
h <- 12
ally <- aggts(y)
n <- nrow(ally)
p <- ncol(ally)
allf <- matrix(NA,nrow = h,ncol = ncol(ally))
res <- matrix(NA, nrow = n, ncol = p)
for(i in 1:p)
{
  fit <- auto.arima(ally[, i])
  allf[, i] <- forecast(fit, h = h)$mean
  res[, i] <- na.omit(ally[, i] - fitted(fit))
}
allf <- ts(allf, start = 51)
y.f <- MinT(allf, groups = g, residual = res, covariance = "shr", keep = "gts", algorithms = "lu")
plot(y.f)}
}
