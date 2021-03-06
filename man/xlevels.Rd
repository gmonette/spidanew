% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/wald.R
\name{xlevels}
\alias{dlevels}
\alias{xlevels}
\title{Create 'derivatives' and 'means' of factors to generate, for example,
pairwise differences or centres of existing factor for prediction}
\usage{
xlevels(f, type = c("raw", "<mean>"), all = FALSE, sep = "")

dlevels(f, type = "pairwise", all = FALSE, sep = "")
}
\arguments{
\item{f}{a factor or otherwise a vector interpreted as the levels of a
factor}

\item{type}{one or more types of contrasts ('derivative') or means (convex
combinations) of factor levels}

\item{all}{for some values of \code{type}, indicates whether to use all
contrasts. e.g. \code{type = "pairwise"} will produce pairwise comparisons
in both directions if \code{all == TRUE}}

\item{sep}{can add spaces in constructed factor levels}

\item{w}{weights used for each factor level in creating contrasts
differentiating a factor level from others. Weights corresponding to
frequencies in the data frame result in effects corresponding to type II
effects while equal weights correspond to type III effects for interacting
specific effects}
}
\description{
The functions \code{xlevels} and \code{dlevels} are primarily intended to
create arguments for \code{expand.grid} to create 'prediction' or 'effect
data frames', to generate wald tests and estimates of specific effects in
models with interactions,
}
\section{Functions}{
\itemize{
\item \code{dlevels}: equivalent of differentiation for a factor
}}

