## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  fig.height = 5,
  fig.width = 7
)

## ----setup--------------------------------------------------------------------
library(DAISIEprep)
library(ape)
library(phylobase)
library(ggtree)
library(ggimage)
library(castor)

## ----simulate phylogeny-------------------------------------------------------
set.seed(
  1,
  kind = "Mersenne-Twister",
  normal.kind = "Inversion",
  sample.kind = "Rejection"
)
phylo <- ape::rcoal(10)

## -----------------------------------------------------------------------------
phylo$tip.label <- c("Plant_a", "Plant_b", "Plant_c", "Plant_d", "Plant_e",
                     "Plant_f", "Plant_g", "Plant_h", "Plant_i", "Plant_j")

## ----convert phylo to phylo4--------------------------------------------------
phylo <- phylobase::phylo4(phylo)
phylobase::plot(phylo)

## ----create island endemcity data---------------------------------------------
endemicity_status <- sample(
  x = c("not_present", "endemic", "nonendemic"),
  size = length(phylobase::tipLabels(phylo)),
  replace = TRUE,
  prob = c(0.6, 0.2, 0.2)
)

## ----convert to phylo4d-------------------------------------------------------
phylod <- phylobase::phylo4d(phylo, as.data.frame(endemicity_status))

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
coccyzus_tree <- ape::read.nexus(
  file = system.file("extdata", "Coccyzus.tre", package = "DAISIEprep")
)
columbiformes_tree <- ape::read.nexus(
  file = system.file("extdata", "Columbiformes.tre", package = "DAISIEprep")
)
finches_tree <- ape::read.nexus(
  file = system.file("extdata", "Finches.tre", package = "DAISIEprep")
)
mimus_tree <- ape::read.nexus(
  file = system.file("extdata", "Mimus.tre", package = "DAISIEprep")
)
myiarchus_tree <- ape::read.nexus(
  file = system.file("extdata", "Myiarchus.tre", package = "DAISIEprep")
)
progne_tree <- ape::read.nexus(
  file = system.file("extdata", "Progne.tre", package = "DAISIEprep")
)
pyrocephalus_tree <- ape::read.nexus(
  file = system.file("extdata", "Pyrocephalus.tre", package = "DAISIEprep")
)
setophaga_tree <- ape::read.nexus(
  file = system.file("extdata", "Setophaga.tre", package = "DAISIEprep")
)

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
coccyzus_phylod <- readRDS(
  file = system.file("extdata", "coccyzus_phylod.rds", package = "DAISIEprep")
)
columbiformes_phylod <- readRDS(
  file = system.file(
    "extdata", "columbiformes_phylod.rds", package = "DAISIEprep"
  )
)
finches_phylod <- readRDS(
  file = system.file("extdata", "finches_phylod.rds", package = "DAISIEprep")
)
mimus_phylod <- readRDS(
  file = system.file("extdata", "mimus_phylod.rds", package = "DAISIEprep")
)
myiarchus_phylod <- readRDS(
  file = system.file("extdata", "myiarchus_phylod.rds", package = "DAISIEprep")
)
progne_phylod <- readRDS(
  file = system.file("extdata", "progne_phylod.rds", package = "DAISIEprep")
)
pyrocephalus_phylod <- readRDS(
  file = system.file(
    "extdata", "pyrocephalus_phylod.rds", package = "DAISIEprep"
  )
)
setophaga_phylod <- readRDS(
  file = system.file("extdata", "setophaga_phylod.rds", package = "DAISIEprep")
)

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

