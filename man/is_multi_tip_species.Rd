% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_multi_tip_species.R
\name{is_multi_tip_species}
\alias{is_multi_tip_species}
\title{Checks if a species is represented in the tree as multiple tips and those
tips form a monophyletic group (i.e. one species with multiple samples)}
\usage{
is_multi_tip_species(phylod, species_label)
}
\arguments{
\item{phylod}{A `phylo4d` object from the package `phylobase` containing
phylogenetic and endemicity data for each species.}

\item{species_label}{The tip label of the species of interest.}
}
\value{
Boolean
}
\description{
Checks if a species is represented in the tree as multiple tips and those
tips form a monophyletic group (i.e. one species with multiple samples)
}
\keyword{internal}
