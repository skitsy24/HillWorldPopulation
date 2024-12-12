#' Display country population
#'
#' Function to display population over time for a specified countryme
#' Fizz Buzz.
#'
#' @param x A country name as a string
#' @return The graph of a countries' population over time as \code{y}
#' @examples
#' CountryPopulation('United States of America')
#' CountryPopulation('Russian Federation')
#' @export

CountryPopulation <- function(x){
  library(stringr)
  library(ggplot2)
  library(tidyverse)
  if(sum(str_detect(WorldPopulation$Country,x)) == 0)
  {
    stop('Country name not in data file. Try again.')
  }
  y <- WorldPopulation %>%
    filter(Country == x) %>%
    group_by(Country) %>%
    ggplot(aes(x = Year, y = Population)) +
    geom_line() +
    labs(title = paste("Population over time for",x)) +
    theme(plot.title= element_text(size = 9))
  return(y)
}
