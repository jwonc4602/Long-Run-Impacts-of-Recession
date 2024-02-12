#### Preamble ####
# Purpose: Downloads and saves Data
# Author: Heyucheng Zhang, Jiwon Choi
# Date: 12 February 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca, jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R

#### Workspace setup ####
library(tidyverse)

#### Download data and save data ####
url <- "https://apps.bea.gov/regional/zip/RPP.zip"
zip_file <- "RPP.zip"

# Set the target directory
target_dir <- "inputs/data/income_data"

# Create the target directory if it doesn't exist
if (!file.exists(target_dir)) {dir.create(target_dir, recursive = TRUE)}

# Download the file to the target directory
download.file(url, paste0(target_dir, "/", zip_file), mode = "wb")

# Unzip the file to the target directory
unzip(paste0(target_dir, "/", zip_file), exdir = target_dir)



         
