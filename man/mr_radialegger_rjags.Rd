% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mr_radialegger_rjags.R
\name{mr_radialegger_rjags}
\alias{mr_radialegger_rjags}
\title{Bayesian radial MR-Egger model with a choice of prior distributions fitted using JAGS.}
\usage{
mr_radialegger_rjags(
  object,
  prior = "default",
  betaprior = "",
  sigmaprior = "",
  n.chains = 3,
  n.burn = 1000,
  n.iter = 5000,
  seed = NULL,
  rho = 0.5,
  ...
)
}
\arguments{
\item{object}{A data object of class \code{\link{mr_format}}.}

\item{prior}{A character string for selecting the prior distributions;
\itemize{
\item \code{"default"} selects a non-informative set of priors;
\item \code{"weak"} selects weakly informative priors;
\item \code{"pseudo"} selects a pseudo-horseshoe prior on the causal effect;
\item \code{"joint"} selects a joint prior on the intercept and slope.
}}

\item{betaprior}{A character string in JAGS syntax to allow a user defined prior for the causal effect.}

\item{sigmaprior}{A character string in JAGS syntax to allow a user defined prior for the residual standard deviation.}

\item{n.chains}{Numeric indicating the number of chains used in the MCMC estimation, the default is \code{3} chains.}

\item{n.burn}{Numeric indicating the burn-in period of the Bayesian MCMC estimation. The default is \code{1000} samples.}

\item{n.iter}{Numeric indicating the number of iterations in the Bayesian MCMC estimation. The default is \code{5000} iterations.}

\item{seed}{Numeric indicating the random number seed. The default is the rjags default.}

\item{rho}{Numeric indicating the correlation coefficient input into the joint prior distribution. The default is \code{0.5}.}

\item{...}{Additional arguments passed through to \code{\link[rjags:jags.model]{rjags::jags.model()}}.}
}
\value{
An object of class \code{radialeggerjags} containing the following components:
\describe{
\item{AvgPleio}{The mean of the simulated pleiotropic effect}
\item{CausalEffect}{The mean of the simulated causal effect}
\item{StandardError}{Standard deviation of the simulated causal effect}
\item{sigma}{The mean of the simulated residual standard deviation}
\item{CredibleInterval}{The credible interval for the causal effect, which includes the lower (2.5\%), median (50\%) and upper intervals (97.5\%)}
\item{samples}{Output of the Bayesian MCMC samples}
\item{Prior}{The specified priors}
}
}
\description{
Bayesian radial MR-Egger model with a choice of prior distributions fitted using JAGS.
}
\examples{
if (requireNamespace("rjags", quietly = TRUE)) {
fit <- mr_radialegger_rjags(bmi_insulin)
summary(fit)
plot(fit$samples)
# 90\% credible interval
fitdf <- do.call(rbind.data.frame, fit$samples)
cri90 <- quantile(fitdf$Estimate, probs = c(0.05, 0.95))
print(cri90)
}
}
\references{
Bowden, J., et al., Improving the visualization, interpretation and analysis of two-sample summary data Mendelian randomization via the Radial plot and Radial regression. International Journal of Epidemiology, 2018. 47(4): p. 1264-1278. \doi{10.1093/ije/dyy101}.
}
