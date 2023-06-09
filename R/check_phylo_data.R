#' Checks whether `\linkS4class{phylo4d}` object conforms
#' to the requirements of the DAISIEprep package. If the function does not
#' return anything the data is ready to be used, if an error is returned the
#' data requires some pre-processing before DAISIEprep can be used
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing or error message
#' @export
#'
#' @examples
#' set.seed(
#'   1,
#'   kind = "Mersenne-Twister",
#'   normal.kind = "Inversion",
#'   sample.kind = "Rejection"
#' )
#' phylo <- ape::rcoal(10)
#' phylo$tip.label <- c("bird_a", "bird_b", "bird_c", "bird_d", "bird_e",
#'                      "bird_f", "bird_g", "bird_h", "bird_i", "bird_j")
#' phylo <- phylobase::phylo4(phylo)
#' endemicity_status <- sample(
#'   c("not_present", "endemic", "nonendemic"),
#'   size = length(phylobase::tipLabels(phylo)),
#'   replace = TRUE,
#'   prob = c(0.6, 0.2, 0.2)
#' )
#' phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
#' check_phylo_data(phylod)
check_phylo_data <- function(phylod) {

  # only check if object has not be previously checked
  if (!isTRUE(phylod@metadata$checked)) {

    if (isFALSE(methods::is(phylod, "phylo4d"))) {
      stop("Object must be of the class phylo4d")
    }

    # extract the tip labels from the tree
    tip_labels <- unname(phylobase::tipLabels(phylod))
    split_tip_labels <- strsplit(tip_labels, split = "_")

    # check the tip labels are in genus_species_marker format
    # (marker is optional)
    correct_structure <- all(sapply(split_tip_labels, function(x) {
      length(x) >= 2
    }))

    if (isFALSE(correct_structure)) {
      stop("Tip labels on the phylogeny need to be in the format genus
         underscore species and then optionally underscore and molecular
         marker or collection tag")
    }

    # extract genus names
    genus_name <- lapply(split_tip_labels, "[[", 1)

    #check genus names only contains letters
    correct_genus_name <- lapply(genus_name, function(x) {
      grep(pattern = "^[A-z]+$", x)
    })
    correct_genus_name <- all(unlist(correct_genus_name) == 1)

    # extract species names
    species_name <- lapply(split_tip_labels, "[[", 2)

    # check species names only contains letters
    correct_species_name <- sapply(species_name, function(x) {
      grep(pattern = "^[A-z]+$", x)
    })
    correct_species_name <- all(unlist(correct_species_name) == 1)

    correct_name <- correct_genus_name && correct_species_name

    if (isFALSE(correct_name)) {
      stop("The genus or species names in the tip labels contain non-alphabetic
         characters")
    }

    if (isFALSE(phylobase::hasTipData(phylod))) {
      stop("Object must have endemicity status stored as tip data")
    }

    correct_trait_data <-
      all(names(phylobase::tdata(phylod)) %in%
            c("endemicity_status", "island_status",
              "endemic_prob", "nonendemic_prob", "not_present_prob"))
    if (isFALSE(correct_trait_data)) {
      stop("Tip data must be called endemicity_status, node data must be called
         island_status, and node probabilities are called endemic_prob,
         nonendemic_prob and not_present_prob")
    }

    status <- phylobase::tipData(phylod)$endemicity_status
    if (isFALSE(all(status %in% c("endemic", "nonendemic", "not_present")))) {
      stop("Endemicity status must be either 'endemic', 'nonendemic', or
         'not_present'")
    }

    # check if there are no species are on the island
    all_not_present <- all(
      phylobase::tipData(phylod)$endemicity_status %in% "not_present"
    )

    if (all_not_present) {
      stop("No species in the phylogeny are on the island")
    }

    # check there is a not present outgroup for stem age colonisation
    any_outgroup <- any_outgroup(phylod = phylod)

    if (isFALSE(any_outgroup)) {
      stop("Phylogeny must contain an outgroup not present on the island to
          extract stem age of the island colonisation")
    }

    phylod@metadata$checked <- TRUE
  }
  invisible(phylod)
}
