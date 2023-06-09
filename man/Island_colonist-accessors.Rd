% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/island_colonist-accessors.R
\name{get_clade_name}
\alias{get_clade_name}
\alias{get_clade_name,Island_colonist-method}
\alias{set_clade_name<-}
\alias{set_clade_name<-,Island_colonist-method}
\alias{get_status}
\alias{get_status,Island_colonist-method}
\alias{set_status<-}
\alias{set_status<-,Island_colonist-method}
\alias{get_missing_species}
\alias{get_missing_species,Island_colonist-method}
\alias{set_missing_species<-}
\alias{set_missing_species<-,Island_colonist-method}
\alias{get_col_time}
\alias{get_col_time,Island_colonist-method}
\alias{set_col_time<-}
\alias{set_col_time<-,Island_colonist-method}
\alias{get_col_max_age}
\alias{get_col_max_age,Island_colonist-method}
\alias{set_col_max_age<-}
\alias{set_col_max_age<-,Island_colonist-method}
\alias{get_branching_times}
\alias{get_branching_times,Island_colonist-method}
\alias{set_branching_times<-}
\alias{set_branching_times<-,Island_colonist-method}
\alias{get_min_age}
\alias{get_min_age,Island_colonist-method}
\alias{set_min_age<-}
\alias{set_min_age<-,Island_colonist-method}
\alias{get_species}
\alias{get_species,Island_colonist-method}
\alias{set_species<-}
\alias{set_species<-,Island_colonist-method}
\alias{get_clade_type}
\alias{get_clade_type,Island_colonist-method}
\alias{set_clade_type<-}
\alias{set_clade_type<-,Island_colonist-method}
\title{Accessor functions for the data (slots) in objects of the
\code{\linkS4class{Island_colonist}} class}
\usage{
get_clade_name(x)

\S4method{get_clade_name}{Island_colonist}(x)

set_clade_name(x) <- value

\S4method{set_clade_name}{Island_colonist}(x) <- value

get_status(x)

\S4method{get_status}{Island_colonist}(x)

set_status(x) <- value

\S4method{set_status}{Island_colonist}(x) <- value

get_missing_species(x)

\S4method{get_missing_species}{Island_colonist}(x)

set_missing_species(x) <- value

\S4method{set_missing_species}{Island_colonist}(x) <- value

get_col_time(x)

\S4method{get_col_time}{Island_colonist}(x)

set_col_time(x) <- value

\S4method{set_col_time}{Island_colonist}(x) <- value

get_col_max_age(x)

\S4method{get_col_max_age}{Island_colonist}(x)

set_col_max_age(x) <- value

\S4method{set_col_max_age}{Island_colonist}(x) <- value

get_branching_times(x)

\S4method{get_branching_times}{Island_colonist}(x)

set_branching_times(x) <- value

\S4method{set_branching_times}{Island_colonist}(x) <- value

get_min_age(x)

\S4method{get_min_age}{Island_colonist}(x)

set_min_age(x) <- value

\S4method{set_min_age}{Island_colonist}(x) <- value

get_species(x)

\S4method{get_species}{Island_colonist}(x)

set_species(x) <- value

\S4method{set_species}{Island_colonist}(x) <- value

get_clade_type(x)

\S4method{get_clade_type}{Island_colonist}(x)

set_clade_type(x) <- value

\S4method{set_clade_type}{Island_colonist}(x) <- value
}
\arguments{
\item{x}{An object whose class is determined by the signature.}

\item{value}{A value which can take several forms to be assigned to an object
of a class.}
}
\value{
Getter functions (get_*) return a variable from the Island_colonist
class, the setter functions (set_*) return the modified Island_colonist
class.
}
\description{
Accessor functions for the data (slots) in objects of the
\code{\linkS4class{Island_colonist}} class
}
\examples{
  colonist <- island_colonist()
  get_clade_name(colonist)
  set_clade_name(colonist) <- "abc"
  get_status(colonist)
  set_status(colonist) <- "abc"
  get_missing_species(colonist)
  set_missing_species(colonist) <- 0
  get_col_time(colonist)
  set_col_time(colonist) <- 1
  get_col_max_age(colonist)
  set_col_max_age(colonist) <- FALSE
  get_branching_times(colonist)
  set_branching_times(colonist) <- 0
  get_min_age(colonist)
  set_min_age(colonist) <- 0.1
  get_species(colonist)
  set_species(colonist) <- "abc_a"
  get_clade_type(colonist)
  set_clade_type(colonist) <- 1
}
\author{
Joshua W. Lambert
}
