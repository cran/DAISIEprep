#' Fits a model of ancestral state reconstruction of island presence
#'
#' @inheritParams default_params_doc
#'
#' @return An object of `phylo4d` class with tip and node data
#' @export
add_asr_node_states <- function(phylod,
                                asr_method,
                                tie_preference = "island",
                                earliest_col = FALSE) {

  # check the phylod input
  phylod <- check_phylo_data(phylod)

  # encode tip states as numerics, the asr method cannot handle zero as a state
  tip_states <- c()
  endemicity_status <- phylobase::tipData(phylod)$endemicity_status
  for (i in seq_along(endemicity_status)) {
    if (grepl(pattern = "^not_present$", x = endemicity_status[i])) {
      tip_states[i] <- 1
    } else if (grepl(pattern = "^nonendemic$", x = endemicity_status[i])) {
      tip_states[i] <- 2
    } else if (grepl(pattern = "^endemic$", x = endemicity_status[i])) {
      tip_states[i] <- 3
    }
  }

  # castor asr functions require S3 phylo objects
  # suppress warnings about tree conversion as they are fine
  phylo <- suppressWarnings(methods::as(phylod, "phylo"))

  if (grepl("parsimony", asr_method, ignore.case = TRUE)) {
    asr <- castor::asr_max_parsimony(
      tree = phylo,
      tip_states = tip_states,
      transition_costs = "sequential"
    )
  } else if (grepl("mk", asr_method, ignore.case = TRUE)) {
    asr <- castor::asr_mk_model(tree = phylo, tip_states = tip_states)
  }

  if (ncol(asr$ancestral_likelihoods) == 2) {
    colnames(asr$ancestral_likelihoods) <- c("not_present", "nonendemic")
  } else if (ncol(asr$ancestral_likelihoods) == 3) {
    colnames(asr$ancestral_likelihoods) <-
      c("not_present", "nonendemic", "endemic")
  }


  if (isFALSE(earliest_col)) {
    if (tie_preference == "island") {
      node_states <- max.col(asr$ancestral_likelihoods, ties.method = "last")
    } else if (tie_preference == "mainland") {
      node_states <- max.col(asr$ancestral_likelihood, ties.method = "first")
    }
  } else if (isTRUE(earliest_col)) {
    # colonisation time is the first non-zero probability of island presence
    node_states <- apply(
      X = asr$ancestral_likelihoods,
      MARGIN = 1,
      FUN = function(x) {
        island_presense <- (x[2] > 0) + 1
      }
    )
  }

  # convert numeric to string
  node_states <- gsub(
    pattern = "1", replacement = "not_present", x = node_states
  )
  node_states <- gsub(
    pattern = "2", replacement = "nonendemic", x = node_states
  )
  node_states <- gsub(
    pattern = "3", replacement = "endemic", x = node_states
  )

  if (ncol(asr$ancestral_likelihoods) == 2) {
    node_data <- data.frame(
      island_status = node_states,
      nonendemic_prob = asr$ancestral_likelihoods[, "nonendemic"],
      not_present_prob = asr$ancestral_likelihoods[, "not_present"],
      row.names = phylobase::nodeId(phylod, "internal")
    )
  } else if (ncol(asr$ancestral_likelihoods) == 3) {
    node_data <- data.frame(
      island_status = node_states,
      endemic_prob = asr$ancestral_likelihoods[, "endemic"],
      nonendemic_prob = asr$ancestral_likelihoods[, "nonendemic"],
      not_present_prob = asr$ancestral_likelihoods[, "not_present"],
      row.names = phylobase::nodeId(phylod, "internal")
    )
  }

  tip_data <- data.frame(
    endemicity_status = phylobase::tipData(phylod)$endemicity_status,
    row.names = phylobase::nodeId(phylod, "tip")
  )

  # combine node data into phylod
  phylod <- phylobase::phylo4d(
    phylo,
    tip.data = tip_data,
    node.data = node_data
  )

  # return phylod object
  phylod
}
