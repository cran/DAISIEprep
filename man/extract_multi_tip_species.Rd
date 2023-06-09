% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_multi_tip_species.R
\name{extract_multi_tip_species}
\alias{extract_multi_tip_species}
\title{Extracts the information for a species (endemic or non-endemic) which has
multiple tips in the phylogeny (i.e. more than one sample per species) from
a phylogeny (specifically `phylo4d`  object from `phylobase` package)
and stores it in an `Island_colonist` class}
\usage{
extract_multi_tip_species(phylod, species_label, species_endemicity)
}
\arguments{
\item{phylod}{A `phylo4d` object from the package `phylobase` containing
phylogenetic and endemicity data for each species.}

\item{species_label}{The tip label of the species of interest.}

\item{species_endemicity}{A character string with the endemicity, either
"endemic" or "nonendemic" of an island species, or "not_present" if not on
the island.}
}
\value{
An object of `Island_colonist` class
}
\description{
Extracts the information for a species (endemic or non-endemic) which has
multiple tips in the phylogeny (i.e. more than one sample per species) from
a phylogeny (specifically `phylo4d`  object from `phylobase` package)
and stores it in an `Island_colonist` class
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
                     "bird_f", "bird_g", "bird_h_1", "bird_h_2", "bird_i")
phylo <- phylobase::phylo4(phylo)
endemicity_status <- c("not_present", "not_present", "not_present",
                       "not_present", "not_present", "not_present",
                       "not_present",  "endemic", "endemic", "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
extract_multi_tip_species(
  phylod = phylod,
  species_label = "bird_h_1",
  species_endemicity = "endemic"
)
}
