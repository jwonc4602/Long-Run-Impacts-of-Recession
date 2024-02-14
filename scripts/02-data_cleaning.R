#### Preamble ####
# Purpose: Cleans the raw data
# Author: Heyucheng Zhang, Jiwon Choi
# Date: 12 February 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca, jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R and 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(readxl)

#### Clean data ####

# Read data
unemployment <- read_excel("inputs/data/BLS_all_archived_counties7689aa (UNOFFICIAL).xlsx")
personal_income <- read_csv("inputs/data/CA1_1969_2013_ALL.csv")

# Group unemployment data by state and year, calculating average for labor force, employed, unemployed, and unemployment rate
cleaned_unemployment <-
  unemployment |>
  group_by(state_name, year) |>
  summarise(
    average_labor_force = mean(laborforce, na.rm = TRUE),
    average_employed = mean(employed, na.rm = TRUE),
    average_unemployed = mean(unemployed, na.rm = TRUE),
    average_unemployment_rate = mean(unemployedrate, na.rm = TRUE)
  ) |>
  ungroup()

# Get records from New York, Florida, Texas, and California
cleaned_four_states <-
  cleaned_unemployment |>
  filter(state_name %in% c("New York", "Florida", "Texas", "California"))

# Get records for the United States
USA_personal_income <-
  personal_income |>
  filter(GeoName == "United States")

# Filter for the description of "Per capita personal income (dollars) 2/" and select the Description column and the year columns from 1969 to 2013
cleaned_personal_income <-
  USA_personal_income |>
  filter(Description == "Per capita personal income (dollars) 2/") |>
  select(Description, `1969`:`2013`)

#### Save data ####
write_csv(cleaned_unemployment, "outputs/data/cleaned_unemployment.csv")
write_csv(cleaned_four_states, "outputs/data/cleaned_four_states.csv")
write_csv(cleaned_personal_income, "outputs/data/cleaned_personal_income.csv")

