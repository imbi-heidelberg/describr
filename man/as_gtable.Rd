% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/describr.R
\name{as_gtable}
\alias{as_gtable}
\alias{as_gtable}
\alias{as_gtable.describr}
\title{Make object plottable using \code{grid}}
\usage{
as_gtable(x, ...)

\method{as_gtable}{describr}(dscr, ...)
}
\arguments{
\item{x}{object to plot.}
}
\value{
A \code{gtable}.
}
\description{
\code{as_gtable} turns an object in a \code{gtable} which can be plotted using
\code{\link[grid]{grid.draw}}.
}
