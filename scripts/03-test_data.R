#### Preamble ####
# Purpose: Tests the cleaned data from "outputs/data/cleaned_data.csv"
# Author: Heyucheng Zhang, Jiwon Choi
# Date: 12 February 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca, jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R，01-download_data.R and 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)

#### Test data ####

# Read data
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")
