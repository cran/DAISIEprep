test_that("1 nonendemic, 2 species tree, min", {
  phylod <- create_test_phylod(test_scenario = 1)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.755181833128)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 nonendemic, 3 species tree, min, outgroup", {
  phylod <- create_test_phylod(test_scenario = 2)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_c",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_c")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 1.43337005682)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_c")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 nonendemic, 3 species tree, min, non-outgroup", {
  phylod <- create_test_phylod(test_scenario = 3)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.251727277709)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 nonendemic, 4 species tree, min, outgroup", {
  phylod <- create_test_phylod(test_scenario = 4)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_a",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_a")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.665451291928)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_a")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 nonendemic, 4 species tree, min, non-outgroup", {
  phylod <- create_test_phylod(test_scenario = 5)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.519744565224)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 endemic, 2 species tree, min", {
  phylod <- create_test_phylod(test_scenario = 6)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.755181833128)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 endemic, 3 species tree, min, outgroup", {
  phylod <- create_test_phylod(test_scenario = 7)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_c",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_c")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 1.43337005682)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_c")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 endemic, 3 species tree, min, non-outgroup", {
  phylod <- create_test_phylod(test_scenario = 8)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.251727277709)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 endemic, 4 species tree, min, outgroup", {
  phylod <- create_test_phylod(test_scenario = 9)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_a",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_a")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.665451291928)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_a")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("1 endemic, 4 species tree, min, non-outgroup", {
  phylod <- create_test_phylod(test_scenario = 10)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.519744565224)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 nonendemics, 3 species tree, min, sisters", {
  phylod <- create_test_phylod(test_scenario = 11)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_a",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_a")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.251727277709)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_a")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 nonendemics, 4 species tree, min, sister", {
  phylod <- create_test_phylod(test_scenario = 12)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_c",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_c")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.125863638855)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_c")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 nonendemics, 4 species tree, min, non-sisters", {
  phylod <- create_test_phylod(test_scenario = 13)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "nonendemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "nonendemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.519744565224)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 endemics, 3 species tree, min, sisters", {
  phylod <- create_test_phylod(test_scenario = 14)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_a",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_a")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 1.433370056817)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_equal(
    get_island_tbl(island_tbl)$branching_times,
    I(list(0.251727277709))
  )
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(
    get_island_tbl(island_tbl)$species,
    I(list(c("bird_a", "bird_b")))
  )
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 endemics, 4 species tree, min, sisters", {
  phylod <- create_test_phylod(test_scenario = 15)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_c",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_c")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.519744565224)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_equal(
    get_island_tbl(island_tbl)$branching_times,
    I(list(0.125863638855))
  )
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(
    get_island_tbl(island_tbl)$species,
    I(list(c("bird_c", "bird_d")))
  )
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})

test_that("2 endemics, 4 species tree, min, non-sisters", {
  phylod <- create_test_phylod(test_scenario = 16)
  island_tbl <- extract_species_min(
    phylod = phylod,
    species_label = "bird_b",
    species_endemicity = "endemic",
    island_tbl = island_tbl(),
    unique_clade_name = TRUE
  )

  expect_s4_class(island_tbl, "Island_tbl")
  expect_true(is.data.frame(get_island_tbl(island_tbl)))
  expect_equal(
    colnames(get_island_tbl(island_tbl)),
    c("clade_name", "status", "missing_species", "col_time", "col_max_age",
      "branching_times", "min_age", "species", "clade_type")
  )
  expect_equal(get_island_tbl(island_tbl)$clade_name, "bird_b")
  expect_equal(get_island_tbl(island_tbl)$status, "endemic")
  expect_equal(get_island_tbl(island_tbl)$missing_species, 0)
  expect_equal(get_island_tbl(island_tbl)$col_time, 0.519744565224)
  expect_false(get_island_tbl(island_tbl)$col_max_age)
  expect_true(is.na(get_island_tbl(island_tbl)$branching_times))
  expect_true(is.na(get_island_tbl(island_tbl)$min_age))
  expect_equal(get_island_tbl(island_tbl)$species, I(list("bird_b")))
  expect_equal(get_island_tbl(island_tbl)$clade_type, 1)
})
