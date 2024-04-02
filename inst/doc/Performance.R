## ----include = FALSE----------------------------------------------------------
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
# Internal function - Not to be called for regular 'DAISIEprep' operation,
# but merely to load in data
performance_data <- DAISIEprep:::read_performance()

## ----plot-min-prob-on-island--------------------------------------------------
plot_performance(
  performance_data = performance_data$performance_data_min,
  group_by = prob_on_island
)

## ----plot-asr-prob-on-island--------------------------------------------------
plot_performance(
  performance_data = performance_data$performance_data_asr,
  group_by = prob_on_island
)

## ----plot-min-prob-endemic----------------------------------------------------
plot_performance(
  performance_data = performance_data$performance_data_min,
  group_by = prob_endemic
)

## ----plot-asr-prob-endemic----------------------------------------------------
plot_performance(
  performance_data = performance_data$performance_data_min,
  group_by = prob_endemic
)

## -----------------------------------------------------------------------------
grouped_performance_data <- dplyr::group_by(
  performance_data$performance_data_min,
  tree_size,
  "prob_on_island"
)

mean_performance_data <- dplyr::summarise(
  grouped_performance_data,
  mean = mean(median_time),
  .groups = "drop"
)

fit_min <- lm(log(mean_performance_data$mean) ~ log(mean_performance_data$tree_size))
fit_min$coefficients

grouped_performance_data <- dplyr::group_by(
  performance_data$performance_data_asr,
  tree_size,
  "prob_on_island"
)

mean_performance_data <- dplyr::summarise(
  grouped_performance_data,
  mean = mean(median_time),
  .groups = "drop"
)

fit_asr <- lm(log(mean_performance_data$mean) ~ log(mean_performance_data$tree_size))
fit_asr$coefficients

