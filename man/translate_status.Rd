% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/translate_status.R
\name{translate_status}
\alias{translate_status}
\title{Takes a string of the various ways the island species status can be and
returns a uniform all lower-case string of the same status to make handling
statuses easier in other function}
\usage{
translate_status(status)
}
\arguments{
\item{status}{Character endemicity status of the colonising clade.}
}
\value{
Character string
}
\description{
Takes a string of the various ways the island species status can be and
returns a uniform all lower-case string of the same status to make handling
statuses easier in other function
}
\examples{
translate_status("Endemic")
}
