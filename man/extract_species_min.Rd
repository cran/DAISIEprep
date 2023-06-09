% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_species_min.R
\name{extract_species_min}
\alias{extract_species_min}
\title{Extracts the colonisation, diversification, and endemicty data from
phylogenetic and endemicity data and stores it in an `Island_tbl` object
using the "min" algorithm that extract island species as the shortest time
to the present.}
\usage{
extract_species_min(
  phylod,
  species_label,
  species_endemicity,
  island_tbl,
  unique_clade_name
)
}
\arguments{
\item{phylod}{A `phylo4d` object from the package `phylobase` containing
phylogenetic and endemicity data for each species.}

\item{species_label}{The tip label of the species of interest.}

\item{species_endemicity}{A character string with the endemicity, either
"endemic" or "nonendemic" of an island species, or "not_present" if not on
the island.}

\item{island_tbl}{An instance of the `Island_tbl` class.}

\item{unique_clade_name}{Boolean determining whether a unique species
identifier is used as the clade name in the Island_tbl object or a genus
name which may not be unique if that genus has several independent island
colonisations}
}
\value{
An object of `island_tbl` class
}
\description{
Extracts the colonisation, diversification, and endemicty data from
phylogenetic and endemicity data and stores it in an `Island_tbl` object
using the "min" algorithm that extract island species as the shortest time
to the present.
}
\examples{
set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)
phylo <- ape::rcoal(10)
phylo$tip.label <- c("bird_a", "bird_b", "bird_c", "bird_d", "bird_e",
                     "bird_f", "bird_g", "bird_h", "bird_i", "bird_j")
phylo <- phylobase::phylo4(phylo)
endemicity_status <- sample(
  c("not_present", "endemic", "nonendemic"),
  size = length(phylobase::tipLabels(phylo)),
  replace = TRUE,
  prob = c(0.6, 0.2, 0.2)
)
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
island_tbl <- island_tbl()
extract_species_min(
  phylod = phylod,
  species_label = "bird_g",
  species_endemicity = "nonendemic",
  island_tbl = island_tbl,
  unique_clade_name = TRUE
)
}
