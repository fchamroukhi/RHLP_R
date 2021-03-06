% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParamRHLP.R
\docType{class}
\name{ParamRHLP-class}
\alias{ParamRHLP-class}
\alias{ParamRHLP}
\title{A Reference Class which contains parameters of a RHLP model.}
\description{
ParamRHLP contains all the parameters of a RHLP model. The parameters are
calculated by the initialization Method and then updated by the Method
implementing the M-Step of the EM algorithm.
}
\section{Fields}{

\describe{
\item{\code{X}}{Numeric vector of length \emph{m} representing the covariates/inputs
\eqn{x_{1},\dots,x_{m}}.}

\item{\code{Y}}{Numeric vector of length \emph{m} representing the observed
response/output \eqn{y_{1},\dots,y_{m}}.}

\item{\code{m}}{Numeric. Length of the response/output vector \code{Y}.}

\item{\code{K}}{The number of regimes (RHLP components).}

\item{\code{p}}{The order of the polynomial regression.}

\item{\code{q}}{The dimension of the logistic regression. For the purpose of
segmentation, it must be set to 1.}

\item{\code{variance_type}}{Character indicating if the model is homoskedastic
(\code{variance_type = "homoskedastic"}) or heteroskedastic (\code{variance_type = "heteroskedastic"}). By default the model is heteroskedastic.}

\item{\code{W}}{Parameters of the logistic process. \eqn{\boldsymbol{W} =
  (\boldsymbol{w}_{1},\dots,\boldsymbol{w}_{K-1})}{W = (w_{1},\dots,w_{K-1})}
is a matrix of dimension \eqn{(q + 1, K - 1)}, with \code{q} the order of the
logistic regression. \code{q} is fixed to 1 by default.}

\item{\code{beta}}{Parameters of the polynomial regressions. \eqn{\boldsymbol{\beta}
  = (\boldsymbol{\beta}_{1},\dots,\boldsymbol{\beta}_{K})}{\beta =
  (\beta_{1},\dots,\beta_{K})} is a matrix of dimension \eqn{(p + 1, K)},
with \code{p} the order of the polynomial regression. \code{p} is fixed to 3 by
default.}

\item{\code{sigma2}}{The variances for the \code{K} regimes. If RHLP model is
heteroskedastic (\code{variance_type = "heteroskedastic"}) then \code{sigma2} is a
matrix of size \eqn{(K, 1)} (otherwise RHLP model is homoskedastic
(\code{variance_type = "homoskedastic"}) and \code{sigma2} is a matrix of size
\eqn{(1, 1)}).}

\item{\code{nu}}{The degree of freedom of the RHLP model representing the complexity
of the model.}

\item{\code{phi}}{A list giving the regression design matrices for the polynomial
and the logistic regressions.}
}}

\section{Methods}{

\describe{
\item{\code{initParam(try_algo = 1)}}{Method to initialize parameters \code{W}, \code{beta} and
      \code{sigma2}.

      If \code{try_algo = 1} then \code{beta} and \code{sigma2} are
      initialized by segmenting  the time series \code{Y} uniformly into
      \code{K} contiguous segments. Otherwise, \code{W}, \code{beta} and
      \code{sigma2} are initialized by segmenting randomly the time series
      \code{Y} into \code{K} segments.}

\item{\code{MStep(statRHLP, verbose_IRLS)}}{Method which implements the M-step of the EM algorithm to learn the
parameters of the RHLP model based on statistics provided by the object
\code{statRHLP} of class \link{StatRHLP} (which contains the E-step).}
}}

