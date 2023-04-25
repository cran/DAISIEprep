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

## -----------------------------------------------------------------------------
sensitivity_data <- DAISIEprep:::read_sensitivity()

## -----------------------------------------------------------------------------
DAISIEprep:::plot_sensitivity(
  sensitivity_data = sensitivity_data$sensitivity_dna
)

## -----------------------------------------------------------------------------
DAISIEprep:::plot_sensitivity(
  sensitivity_data = sensitivity_data$sensitivity_complete
)

## -----------------------------------------------------------------------------
DAISIEprep:::plot_sensitivity(
  sensitivity_data = sensitivity_data$sensitivity_dna,
  pairwise_diffs = TRUE
)

## -----------------------------------------------------------------------------
DAISIEprep:::plot_sensitivity(
  sensitivity_data = sensitivity_data$sensitivity_complete,
  pairwise_diffs = TRUE
)

