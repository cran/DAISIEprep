% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/endemicity_to_sse_states.R
\name{get_sse_tip_states}
\alias{get_sse_tip_states}
\title{Extract tip states from a phylod object}
\usage{
get_sse_tip_states(phylod, sse_model = "musse")
}
\arguments{
\item{phylod}{A `phylo4d` object from the package `phylobase` containing
phylogenetic and endemicity data for each species.}

\item{sse_model}{either "musse" (default) or "geosse". MuSSE expects state
values 1, 2, 3, which here we encode as "not_present", "endemic",
"nonendemic", respectively. GeoSSE expects trait values 0, 1, 2, with 0 the
widespread state (here, "nonendemic"), and 1 and 2 are "not_present" and
"endemic", respectively.}
}
\value{
an integer vector of tip states, as expected by SSE models
}
\description{
Extract tip states from a phylod object
}
