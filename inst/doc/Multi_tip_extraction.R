## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(DAISIEprep)
library(ape)
library(phylobase)

## ----sim-data, fig.height=5, fig.width=8--------------------------------------
set.seed(1)
tree <- ape::rcoal(10)
tree$tip.label <- paste("Plant", letters[1:10], sep = "_")
tree$tip.label[4] <- "Plant_d_a"
tree$tip.label[5] <- "Plant_d_b"
phylo <- phylobase::phylo4(tree)
endemicity_status <- c("not_present", "not_present", "not_present", "nonendemic", 
                       "nonendemic", "not_present", "not_present", 
                       "not_present", "endemic", "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
plot_phylod(phylod)

## -----------------------------------------------------------------------------
island_tbl <- extract_island_species(phylod = phylod, extraction_method = "min")
island_tbl

## ----sample-label, fig.height=5, fig.width=8----------------------------------
endemicity_status <- c("not_present", "not_present", "not_present", 
                       "nonendemic", "not_present", "not_present",
                       "not_present", "not_present", "endemic", "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
plot_phylod(phylod)

## -----------------------------------------------------------------------------
island_tbl <- extract_island_species(phylod = phylod, extraction_method = "min")
island_tbl

## ----species-encode-endemic, fig.height=5, fig.width=8------------------------
endemicity_status <- c("not_present", "not_present", "not_present", "endemic", 
                       "endemic", "not_present", "not_present", 
                       "not_present", "endemic", "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
plot_phylod(phylod)
island_tbl <- extract_island_species(phylod = phylod, extraction_method = "min")
island_tbl

## ----species-encode-endemic-3, fig.height=5, fig.width=8----------------------
phylobase::tipLabels(phylo) <- c("Plant_a", "Plant_d_a", "Plant_d_b",
                                 "Plant_d_c", "Plant_d_d", "Plant_b", "Plant_c",
                                 "Plant_e", "Plant_f", "Plant_g")
endemicity_status <- c("not_present", "endemic", "endemic", "endemic", 
                       "endemic", "not_present", "not_present", 
                       "not_present", "endemic", "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
plot_phylod(phylod)
island_tbl <- extract_island_species(phylod = phylod, extraction_method = "min")
island_tbl

## ----geo-encode-2-island, fig.height=5, fig.width=8---------------------------
phylobase::tipLabels(phylo) <- c("Plant_a", "Plant_b", "Plant_c", "Plant_d",
                                 "Plant_e", "Plant_f", "Plant_g_mainland",
                                 "Plant_g_island_b", "Plant_g_island_a", 
                                 "Plant_h")
endemicity_status <- c("not_present", "not_present", "not_present", 
                       "not_present", "not_present", "not_present", 
                       "not_present", "nonendemic", "nonendemic", 
                       "not_present")
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))
plot_phylod(phylod)
island_tbl <- extract_island_species(phylod = phylod, extraction_method = "min")
island_tbl

