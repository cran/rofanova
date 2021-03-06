% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{simulate_data}
\alias{simulate_data}
\title{Simulate data for Robust Functional ANOVA}
\usage{
simulate_data(
  scenario = "one-way",
  mean = "M1",
  con = "C0",
  p = 0.1,
  M = 1,
  n_i = 25,
  k_1 = 3,
  k_2 = 3,
  alpha = 0,
  beta = 0,
  sd = 0.01,
  grid = seq(0, 1, length.out = 30),
  err = "s"
)
}
\arguments{
\item{scenario}{A  character strings indicating the scenario considered. It could be "one-way", "two-way", "one-way surface" and "two-way surface".}

\item{mean}{A character strings indicating the type of mean function in one-way ANOVA. It could be "M1", "M2", and "M3".}

\item{con}{A character strings indicating the type of contamination function. It could be "C0", for no contamination, "C1", "C2", "C3", "C4", "C5", and "C6".}

\item{p}{The parameter related to the bernoulli variable in the contamination function.}

\item{M}{The contamination size constant.}

\item{n_i}{The number of observation for each group.}

\item{k_1}{The number of level for the first main effect.}

\item{k_2}{The number of level for the second main effect. For One-way ANOVA, it is ignored.}

\item{alpha}{The parameter a in the Two-way ANOVA scenarios. For One-way ANOVA, it is ignored.}

\item{beta}{The parameter b in the Two-way ANOVA scenarios. For One-way ANOVA, it is ignored.}

\item{sd}{The sigma parameter in the covariance of the error function.}

\item{grid}{The grid over which the functional data are observed.}

\item{err}{The direction of the dependence in the error function for the case of bi-variate functional data. It could be either "s", for dependence along the first dimension or "t" for dependence along the second dimension.}
}
\value{
A list containing the following arguments:
\itemize{
\item \code{X_fdata}: The generated functional data.

\item\code{label_1}: The vector of containing group label corresponding to the first main effect.

\item\code{label_2}: The vector of containing group label corresponding to the second main effect. For one-way ANOVA, it is NULL.
}
}
\description{
Generate synthetic data as in the simulation study of Centofanti et al. (2021) with the addition of the case of bi-variate functional data. All the details are in  Centofanti et al. (2021).
}
\examples{
library(rofanova)
data_out<-simulate_data(scenario="one-way")
label_1=data_out$label_1
X_fdata<-data_out$X_fdata
B=10
cores=1
per_list_median<-rofanova(X_fdata,label_1,B = B,family="median",cores=cores)
pvalue_median_vec<-per_list_median$pval_vec
per_list_huber<-rofanova(X_fdata,label_1,B = B,family="huber",cores=cores)
pvalue_huber_vec<-per_list_huber$pval_vec
per_list_bisquare<-rofanova(X_fdata,label_1,B = B,family="bisquare",cores=cores)
pvalue_bisquare_vec<-per_list_bisquare$pval_vec
per_list_hampel<-rofanova(X_fdata,label_1,B = B,family="hampel",cores=cores)
pvalue_hampel_vec<-per_list_hampel$pval_vec
per_list_optimal<-rofanova(X_fdata,label_1,B = B,family="optimal",cores=cores)
pvalue_optimal<-per_list_optimal$pval
}
\references{
Centofanti, F., Colosimo, B.M., Grasso, M.L., Menafoglio, A., Palumbo, B., Vantini, S. (2021).
Robust Functional ANOVA with Application to Additive Manufacturing.
\emph{arXiv preprint arXiv:2112.10643}.
}
\seealso{
\code{\link{rofanova}} \code{\link{fusem}} \code{\link{funmad}}
}
