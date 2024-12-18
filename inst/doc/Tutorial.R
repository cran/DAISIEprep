## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.height = 5,
  fig.width = 7
)

## ----setup, message=FALSE-----------------------------------------------------
library(DAISIEprep)
library(ape)
library(phylobase)
library(ggtree)
library(ggimage)
library(castor)

## ----load phylogeny-----------------------------------------------------------
data("plant_phylo")

## ----class phylogeny----------------------------------------------------------
class(plant_phylo)

## ----plot phylo---------------------------------------------------------------
plot(plant_phylo, underscore = TRUE)

## ----convert phylo to phylo4--------------------------------------------------
plant_phylo <- phylobase::phylo4(plant_phylo)
phylobase::plot(plant_phylo)

## ----create island endemcity data---------------------------------------------
island_species <- data.frame(
  tip_labels = c("Plant_i", "Plant_g"),
  tip_endemicity_status = c("endemic", "nonendemic")
)
island_species

## -----------------------------------------------------------------------------
endemicity_status <- create_endemicity_status(
  phylo = plant_phylo,
  island_species = island_species
)

## ----convert to phylo4d-------------------------------------------------------
phylod <- phylobase::phylo4d(plant_phylo, endemicity_status)

## ----plot phylogeny with tip data---------------------------------------------
plot_phylod(phylod = phylod)

## ----create island_tbl--------------------------------------------------------
island_tbl <- island_tbl()
island_tbl

## ----extract island data------------------------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "min"
)
island_tbl

## -----------------------------------------------------------------------------
phylod <- add_asr_node_states(phylod = phylod, asr_method = "parsimony")

## ----plot phylogeny with tip and node data------------------------------------
plot_phylod(phylod = phylod)

## -----------------------------------------------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr"
)

## ----display asr island_tbl---------------------------------------------------
island_tbl

## -----------------------------------------------------------------------------
data_list <- create_daisie_data(
  data = island_tbl,
  island_age = 1,
  num_mainland_species = 100,
  precise_col_time = TRUE
)

## -----------------------------------------------------------------------------
data_list[[1]]

## -----------------------------------------------------------------------------
data_list[[2]]

## -----------------------------------------------------------------------------
data(coccyzus_tree, package = "DAISIEprep")
data(columbiformes_tree, package = "DAISIEprep")
data(finches_tree, package = "DAISIEprep")
data(mimus_tree, package = "DAISIEprep")
data(myiarchus_tree, package = "DAISIEprep")
data(progne_tree, package = "DAISIEprep")
data(pyrocephalus_tree, package = "DAISIEprep")
data(setophaga_tree, package = "DAISIEprep")

## ----convert Galapagos phylos to phylo4---------------------------------------
coccyzus_tree <- as(coccyzus_tree, "phylo4")
columbiformes_tree <- as(columbiformes_tree, "phylo4")
finches_tree <- as(finches_tree, "phylo4")
mimus_tree <- as(mimus_tree, "phylo4")
myiarchus_tree <- as(myiarchus_tree, "phylo4")
progne_tree <- as(progne_tree, "phylo4")
pyrocephalus_tree <- as(pyrocephalus_tree, "phylo4")
setophaga_tree <- as(setophaga_tree, "phylo4")

## -----------------------------------------------------------------------------
phylobase::plot(coccyzus_tree, cex = 0.1)

## -----------------------------------------------------------------------------
island_species <- data.frame(
  tip_labels = c("Coccyzus_melacoryphus_GALAPAGOS_L569A",
                 "Coccyzus_melacoryphus_GALAPAGOS_L571A"),
  tip_endemicity_status = c("nonendemic", "nonendemic")
)

## -----------------------------------------------------------------------------
endemicity_status <- create_endemicity_status(
  phylo = coccyzus_tree,
  island_species = island_species
)

## -----------------------------------------------------------------------------
phylod <- phylobase::phylo4d(coccyzus_tree, endemicity_status)

## ----plot coccyzus phylogeny with tip data------------------------------------
plot_phylod(phylod = phylod)

## -----------------------------------------------------------------------------
phylod <- add_asr_node_states(
  phylod = phylod,
  asr_method = "parsimony",
  tie_preference = "mainland"
)

## ----plot phylogeny with tip and node data Coccyzus---------------------------
plot_phylod(phylod = phylod)

## ----extract Coccyzus---------------------------------------------------------
island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr"
)

## -----------------------------------------------------------------------------
island_tbl

## ----load galapagos phylod data-----------------------------------------------
data(coccyzus_phylod, package = "DAISIEprep")
data(columbiformes_phylod, package = "DAISIEprep")
data(finches_phylod, package = "DAISIEprep")
data(mimus_phylod, package = "DAISIEprep")
data(myiarchus_phylod, package = "DAISIEprep")
data(progne_phylod, package = "DAISIEprep")
data(pyrocephalus_phylod, package = "DAISIEprep")
data(setophaga_phylod, package = "DAISIEprep")

## ----extract first Galapagos clade--------------------------------------------
island_tbl <- extract_island_species(
  phylod = coccyzus_phylod,
  extraction_method = "asr"
)

## ----extract the other Galapagos clades---------------------------------------
galapagos_phylod <- list(
  coccyzus_phylod, columbiformes_phylod, finches_phylod, mimus_phylod,
  myiarchus_phylod, progne_phylod, pyrocephalus_phylod, setophaga_phylod
)

for (phylod in galapagos_phylod) {
  island_tbl <- extract_island_species(
    phylod = phylod,
    extraction_method = "asr",
    island_tbl = island_tbl
  )
}

## ----plot Darwins finches-----------------------------------------------------
plot_phylod(finches_phylod)

## ----inspect final island table-----------------------------------------------
island_tbl

## ----create Galapagos data list-----------------------------------------------
data_list <- create_daisie_data(
  data = island_tbl,
  island_age = 4,
  num_mainland_species = 100,
  precise_col_time = TRUE
)

## -----------------------------------------------------------------------------
island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  # num_missing_species equals total species missing
  num_missing_species = 2,
  # name of a sampled species you want to "add" the missing to
  # it can be any in the clade
  species_to_add_to = "C_fus"
)

## -----------------------------------------------------------------------------
island_tbl@island_tbl$species[[3]]

## -----------------------------------------------------------------------------
island_tbl <- add_island_colonist(
  island_tbl = island_tbl,
  clade_name = "Bird_a",
  status = "endemic",
  # clade with just 1 species, missing_species = 0
  # because adding the lineage already counts as 1
  missing_species = 0,
  col_time = 2.5,
  col_max_age = FALSE,
  branching_times = NA_real_,
  min_age = NA_real_,
  species = "Bird_a",
  clade_type = 1
)

## -----------------------------------------------------------------------------
island_tbl <- add_island_colonist(
  island_tbl = island_tbl,
  clade_name = "Bird_b",
  status = "endemic",
  # the total species is 3 and all are missing
  # but we add missing_species = 2 because
  # adding the lineage already counts as 1
  missing_species = 2,
  col_time = 2.5,
  col_max_age = FALSE,
  branching_times = NA_real_,
  min_age = NA_real_,
  clade_type = 1,
  species = c("Bird_b", "Bird_c", "Bird_d")
)

## -----------------------------------------------------------------------------
island_tbl <- add_island_colonist(
  island_tbl = island_tbl,
  clade_name = "Bird_e",
  status = "endemic",
  # clade with just 1 species, missing_species = 0
  # because adding the lineage already counts as 1
  missing_species = 0,
  col_time = NA_real_,
  col_max_age = FALSE,
  branching_times = NA_real_,
  min_age = NA_real_,
  clade_type = 1,
  species = "Bird_e"
)

## -----------------------------------------------------------------------------
island_tbl <- add_island_colonist(
  island_tbl = island_tbl,
  clade_name = "Bird_f",
  status = "endemic",
  # the total species is 5 and all are missing
  # but we add missing_species = 4 because
  # adding the lineage already counts as 1
  missing_species = 4,
  col_time = NA_real_,
  col_max_age = FALSE,
  branching_times = NA_real_,
  min_age = NA_real_,
  clade_type = 1,
  species = c("Bird_f", "Bird_g", "Bird_h",
              "Bird_i", "Bird_j")
)

## -----------------------------------------------------------------------------
island_tbl <- add_island_colonist(
  island_tbl = island_tbl,
  clade_name = "Bird_k",
  status = "endemic",
  missing_species = 0,
  col_time = NA_real_,
  col_max_age = FALSE,
  branching_times = NA_real_,
  min_age = 2,
  species = "Bird_k",
  clade_type = 1
)

## -----------------------------------------------------------------------------
data_list <- create_daisie_data(
  data = island_tbl,
  island_age = 4,
  num_mainland_species = 100,
  precise_col_time = TRUE
)

