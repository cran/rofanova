% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{fusem}
\alias{fusem}
\title{The scale equivariant functional M-estimator}
\usage{
fusem(
  X,
  family = "bisquare",
  eff = 0.95,
  maxit = 50,
  tol = 1e-04,
  mu0_g = NULL,
  sig0_g = NULL
)
}
\arguments{
\item{X}{Either an object of class  \code{fdata} for monodimensional functional data  or an object of class \code{fdata2d} for bi-dimensional functional data.}

\item{family}{The family of loss function for the calculation of the equivariant functional M-estimator. The values allowed are
"bisquare" for the bisquare or Tukey's biweight family of loss functions;  "huber" for the the Huber's family of loss functions;
"optimal" for the  optimal family of loss functions; "hampel" for the the Hampel's family of loss functions; "median" for the median loss function.
A non-robust functional estimator of the mean based on the standard least squares loss function is used with the value "mean". Default is "bisquare".}

\item{eff}{Asymptotic efficiency of the equivariant functional M-estimator. When \code{family} is either "mean" or "median", \code{eff} is ignored.}

\item{maxit}{The maximum number of iterations allowed in the re-weighted least-squares algorithm to compute the equivariant functional M-estimator.}

\item{tol}{The tolerance for the stopping condition of the re-weighted least-squares algorithm to compute the equivariant functional M-estimator.
The algorithm stops when the relative variation of the weighted norm sum between two consecutive iterations is less than \code{tol}.}

\item{mu0_g}{Initial estimate  used in re-weighted least-squares algorithm to compute the equivariant functional M-estimator.
If NULL the standard non-robust functional mean is used. Default is NULL.}

\item{sig0_g}{Estimate of the standard error of \code{X}. If NULL, the functional mean is used. Default is NULL.}
}
\value{
A list containing the following arguments:
\itemize{
\item \code{mu}: The scale equivariant functional M-estimator .

\item\code{mu0_g}: \code{mu0_g}.

\item\code{sig0_g}: \code{sig0_g}.
}
}
\description{
Compute the scale equivariant functional M-estimator as described in Centofanti et al. (2021).
}
\examples{

library(rofanova)
data_out<-simulate_data(scenario="one-way")
X_fdata<-data_out$X_fdata
per_list_median<-fusem(X_fdata)
}
\references{
Centofanti, F., Colosimo, B.M., Grasso, M.L., Menafoglio, A., Palumbo, B., Vantini, S. (2021).
Robust Functional ANOVA with Application to Additive Manufacturing.
\emph{arXiv preprint arXiv:2112.10643}.
}
\seealso{
\code{\link{rofanova}} \code{\link{funmad}}
}
