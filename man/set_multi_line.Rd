% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indent.R
\name{set_multi_line}
\alias{set_multi_line}
\title{Set the multi-line column}
\usage{
set_multi_line(pd)
}
\arguments{
\item{pd}{A parse table.}
}
\description{
Sets the column \code{multi_line} in \code{pd} by checking row-wise whether any child
of a token is a multi-line token.
}
