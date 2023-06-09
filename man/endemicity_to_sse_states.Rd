% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/endemicity_to_sse_states.R
\name{endemicity_to_sse_states}
\alias{endemicity_to_sse_states}
\title{Convert endemicity to SSE states}
\usage{
endemicity_to_sse_states(endemicity_status, sse_model = "musse")
}
\arguments{
\item{endemicity_status}{character vector with values "endemic", "nonendemic"
and/or "not_present"}

\item{sse_model}{either "musse" (default) or "geosse". MuSSE expects state
values 1, 2, 3, which here we encode as "not_present", "endemic",
"nonendemic", respectively. GeoSSE expects trait values 0, 1, 2, with 0 the
widespread state (here, "nonendemic"), and 1 and 2 are "not_present" and
"endemic", respectively.}
}
\value{
an integer vector of tip states, following the encoding expected by
the MuSSE/GeoSSE
}
\description{
Convert endemicity to SSE states
}
