## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(DAISIEprep)
library(ape)
library(phylobase)

## ----fig.height=5, fig.width=8------------------------------------------------
set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)
phylo <- ape::rcoal(10)
phylo$tip.label <- c("Plant_a", "Plant_b", "Plant_c", "Plant_d", "Plant_e",
                     "Plant_f", "Plant_g", "Plant_h", "Plant_i", "Plant_j")
phylo <- phylobase::phylo4(phylo)
endemicity_status <- c("not_present", "not_present", "not_present", 
                       "not_present", "not_present", "not_present",
                       "nonendemic", "nonendemic", "nonendemic",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)

## ----extract-with-fns-false---------------------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr", 
  force_nonendemic_singleton = FALSE
)
island_tbl

## ----extract-with-fns-true----------------------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr", 
  force_nonendemic_singleton = TRUE
)
island_tbl

## ----fig.height=5, fig.width=8------------------------------------------------
endemicity_status <- c("endemic", "endemic", "endemic", 
                       "endemic", "endemic", "not_present",
                       "nonendemic", "nonendemic", "nonendemic",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)

## ----extract-with-fns-true-limitation-----------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr", 
  force_nonendemic_singleton = TRUE
)
island_tbl

## ----fig.height=5, fig.width=8------------------------------------------------
newick <- "(Plant_e:0.9,((Plant_a:0.3,Plant_b:0.3):0.3,(Plant_c:0.3,Plant_d:0.3):0.3):0.3);"
phylo <- ape::read.tree(text = newick)
phylo <- phylobase::phylo4(phylo)
endemicity_status <- c("not_present", "endemic", "endemic", "nonendemic", 
                       "nonendemic")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr", 
  force_nonendemic_singleton = TRUE
)
island_tbl

## ----fig.height=5, fig.width=8------------------------------------------------
endemicity_status <- c("not_present", "nonendemic", "nonendemic", "endemic", 
                       "endemic")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr", 
  force_nonendemic_singleton = TRUE
)
island_tbl

## ----fig.height=5, fig.width=8------------------------------------------------
set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)
phylo <- ape::rcoal(10)
phylo$tip.label <- c("Plant_a", "Plant_b", "Plant_c", "Plant_d", "Plant_e",
                     "Plant_f", "Plant_g", "Plant_h", "Plant_i", "Plant_j")
phylo <- phylobase::phylo4(phylo)
endemicity_status <- c("endemic", "endemic", "endemic", 
                       "endemic", "nonendemic", "endemic",
                       "not_present", "not_present", "not_present",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)

## ----fig.height=5, fig.width=8------------------------------------------------
endemicity_status <- c("endemic", "endemic", "endemic", 
                       "endemic", "endemic", "endemic",
                       "not_present", "not_present", "not_present",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)

## ----fig.height=5, fig.width=8------------------------------------------------
set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)
phylo <- ape::rcoal(10)
phylo$tip.label <- c("Plant_a", "Plant_b", "Plant_c", "Plant_d", "Plant_e",
                     "Plant_f", "Plant_g", "Plant_h", "Plant_i", "Plant_j")
phylo <- phylobase::phylo4(phylo)
endemicity_status <- c("not_present", "nonendemic", "endemic", 
                       "endemic", "endemic", "not_present",
                       "not_present", "nonendemic", "nonendemic",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr"
)
island_tbl

## ----fig.height=5, fig.width=8------------------------------------------------
endemicity_status <- c("not_present", "endemic", "endemic", 
                       "endemic", "endemic", "not_present",
                       "not_present", "nonendemic", "nonendemic",
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
phylod <- add_asr_node_states(phylod = phylod, asr_method = "mk", rate_model = "ER", tie_preference = "mainland")
plot_phylod(phylod = phylod)
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr",
  force_nonendemic_singleton = TRUE
)
island_tbl

