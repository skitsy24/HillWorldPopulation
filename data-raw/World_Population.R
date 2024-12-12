library(tidyverse)
library(readxl)

data <- read_xlsx('data-raw/World_Population.xlsx', sheet = 'ESTIMATES', skip = 16, col_names = TRUE)
WorldPopulation <- data %>%
  filter(str_detect(Type,'Country/Area')) %>%
  rename( 'Country' = 'Region, subregion, country or area *') %>%
  select(Country,'1950':'2020') %>%
  pivot_longer('1950':'2020', names_to = 'Year', values_to = 'Population') %>%
  mutate(Year = as.numeric(Year),
         Population = as.numeric(Population))
usethis::use_data(WorldPopulation)
