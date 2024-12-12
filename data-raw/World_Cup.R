library(rvest)
library(tidyverse)


page <- read_html('https://en.wikipedia.org/wiki/FIFA_World_Cup')
table <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header = FALSE)

World_Cup <- table %>%
  select(X1,X2,X4,X5,X6) %>%
  slice(3:28) %>%
  rename('Year' = X1,'Hosts' = X2,'TotalAttendance'= X4,'Matches' = X5,'AverageAttendance' = X6) %>%
  filter(Year < 2024) %>%
  mutate(TotalAttendance = str_remove_all(TotalAttendance,","),
         AverageAttendance = str_remove_all(AverageAttendance,","),
         TotalAttendance = as.numeric(TotalAttendance),
         AverageAttendance = as.numeric(AverageAttendance)) %>%
  mutate(WorldCup = paste(Hosts,Year),
         WorldCup = str_remove_all(WorldCup,"\\s")) %>%
  select(TotalAttendance,Matches,AverageAttendance,WorldCup)

usethis::use_data(World_Cup)
