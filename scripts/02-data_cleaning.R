#### Preamble ####
# Purpose: Cleans the raw data
# Author: Heyucheng Zhang, Jiwon Choi
# Date: 12 February 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca, jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R and 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("inputs/data/income_data/PARPI_PORT_2008_2022.csv")



#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")
