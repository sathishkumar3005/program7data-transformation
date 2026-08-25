install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
t2cases <- filter(table2, type == "cases") %>% rename(cases = count) %>% arrange(country, year)
t2pop <- filter(table2, type == "population") %>% rename(population = count) %>% arrange(country, year)
t2pop
rate <- tibble( year = t2cases$year, cases = t2cases$cases, country = t2cases$country, population = t2pop$population ) %>% mutate(cases_per_cap = (cases / population) * 10000) %>% select(country, year, cases_per_cap) 
rate <- rate %>% mutate(type = "cases_per_cap") %>% rename(count = cases_per_cap) 
rate
