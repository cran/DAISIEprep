% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_daisie_data.R
\name{create_daisie_data}
\alias{create_daisie_data}
\title{This is a wrapper function for DAISIE::DAISIE_dataprep(). It allows the
final DAISIE data structure to be produced from within DAISIEprep. For
detailed documentation see the help documentation in the DAISIE package
(?DAISIE::DAISIE_dataprep).}
\usage{
create_daisie_data(
  data,
  island_age,
  num_mainland_species,
  num_clade_types = 1,
  list_type2_clades = NA,
  prop_type2_pool = "proportional",
  epss = 1e-05,
  verbose = FALSE,
  precise_col_time = TRUE
)
}
\arguments{
\item{data}{Either an object of class `Island_tbl` or a DAISIE data table
object (output from `as_daisie_datatable()`).}

\item{island_age}{Age of the island in appropriate units.}

\item{num_mainland_species}{The size of the mainland pool, i.e. the number
of species that can potentially colonise the island.}

\item{num_clade_types}{Number of clade types. Default num_clade_types = 1 all
species are considered to belong to the same macroevolutionary process. If
num_clade_types = 2, there are two types of clades with distinct
macroevolutionary processes.}

\item{list_type2_clades}{If num_clade_types = 2, list_type2_clades specifies
the names of the clades that have a distinct macroevolutionary process. The
names must match those in the "Clade_name" column of the source data table.
If num_clade_types = 1, then list_type2_clades = NA should be specified
(default).}

\item{prop_type2_pool}{Specifies the fraction of potential mainland colonists
that have a distinct macroevolutionary process. Applies only if
number_clade_types = 2. Default "proportional" sets the fraction to be
proportional to the number of clades of distinct macroevolutionary process
that have colonised the island. Alternatively, the user can specify a value
between 0 and 1 (e.g. if the mainland pool size is 1000 and prop_type2_pool
= 0.02 then the number of type 2 species is 20).}

\item{epss}{Default = 1e-5 should be appropriate in most cases. This value
is used to set the maximum age of colonisation of "Non_endemic_MaxAge" and
"Endemic_MaxAge" species to an age that is slightly younger than the island
for cases when the age provided for that species is older than the island.
The new maximum age is then used as an upper bound to integrate over all
possible colonisation times.}

\item{verbose}{Boolean. States if intermediate results should be printed to
console. Defaults to FALSE}

\item{precise_col_time}{Boolean, TRUE uses the precise times of colonisation,
FALSE makes every colonist a max age colonistion and uses minimum age of
colonisation if available.}
}
\value{
DAISIE data list
}
\description{
This is a wrapper function for DAISIE::DAISIE_dataprep(). It allows the
final DAISIE data structure to be produced from within DAISIEprep. For
detailed documentation see the help documentation in the DAISIE package
(?DAISIE::DAISIE_dataprep).
}
\examples{
phylod <- create_test_phylod(3)
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "min"
)
daisie_datatable <- as_daisie_datatable(island_tbl, island_age = 10)
daisie_data_list <- create_daisie_data(
  data = daisie_datatable,
  island_age = 10,
  num_mainland_species = 1000,
  num_clade_types = 1,
  list_type2_clades = NA,
  prop_type2_pool = NA,
  epss = 1e-5,
  verbose = FALSE
)
}
