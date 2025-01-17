\name{regpred}


\alias{regpred}


\title{Automatic Time Series forecasting and Missing Value Imputation.}

\description{Automatic time series prediction and missing value imputation.}



\usage{
  regpred(Data, max_lag="auto", alpha=0.05, nsim=1000, flg_print=1, direction="<->")
}


\arguments{
  \item{Data}{data.frame containing target variable at first column and regressors if present from second to last column.}
  \item{max_lag}{maximum time lag to be considered in the autoregressive moving average part of the algorithm. If "auto" then the algorithm will set a suitable value. Set to 0 or NULL if you want to remove the autoregressive moving average part as in case of non time series data.}
  \item{alpha}{significance level for the confidence interval produced around predictions. If 0.05 then the algorithm will calculate a 95\% confidence interval around predictions.}
  \item{nsim}{number of bootstrap replications used for producing confidence interval around predictions.}
  \item{flg_print}{if 1 some information during the evaluation will be printed.}
  \item{direction}{if "->" then only a forward prediction will be executed, if "<-" then only a backward prediction will be executed, if "<->" then both a forward than a backward prediction will be executed if possible. For imputing missing values is convenient to leave default "<->".}
}


\value{An object of \code{class} \code{list} where result$final contains final predictions with confindence intervals and goodness of fit indices, result$forward contains the same information only for forward prediction while result$backward only for backward prediction.}

\author{
  Davide Altomare (\email{info@channelattribution.net}).
}


\references{
\href{https://www.channelattribution.net/docs/rego}{rego Documentation}
}

\examples{

\dontrun{

library(rego)

#example 1: seasonal time series

Data=read.csv(url("https://app.channelattribution.net/data/Data_air.csv"),header=FALSE)

res=regpred(Data)

#print final prediction 
print(res$final$predictions)

#print final L_adj
print(res$final$L_adj)                                                

#example 2: high dimensional problem

Data=read.csv(url("https://app.channelattribution.net/data/Data_sim_1000.csv"),header=FALSE)

res=regpred(Data, max_lag=NULL)

#print final prediction 
print(res$final$predictions)

#print final L_adj
print(res$final$L_adj)                                                

}

}

\keyword{time series forecasting}
\keyword{time series prediction}
\keyword{time series}
\keyword{sarimax}
\keyword{regression}
\keyword{linear regression}
\keyword{missing imputation}
\keyword{prediction intervals}
