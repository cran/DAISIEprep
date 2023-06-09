% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_stem_age_asr.R
\name{extract_stem_age_asr}
\alias{extract_stem_age_asr}
\title{Extracts the stem age from the phylogeny when the a species is known to
belong to a genus but is not itself in the phylogeny and there are members
of the same genus are in the phylogeny using the 'asr' extraction method}
\usage{
extract_stem_age_asr(genus_in_tree, phylod)
}
\arguments{
\item{genus_in_tree}{A numeric vector that indicates which species in the
genus are in the tree}

\item{phylod}{A `phylo4d` object from the package `phylobase` containing
phylogenetic and endemicity data for each species.}
}
\value{
Numeric
}
\description{
Extracts the stem age from the phylogeny when the a species is known to
belong to a genus but is not itself in the phylogeny and there are members
of the same genus are in the phylogeny using the 'asr' extraction method
}
