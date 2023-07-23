# Load required packages
library(tidyverse)
library(arrow)
# AirData Download Files Documentation
# https://aqs.epa.gov/aqsweb/airdata/FileFormats.html

# Define constants
START_YEAR <- 1980
END_YEAR <- 2019
ROOT_PATH <- read.csv("ROOT_PATH.txt", header = F) %>% getElement("V1")
RAW_PATH <- file.path(ROOT_PATH, "datasets", "raw")
PROCESSED_PATH <- file.path(ROOT_PATH, "datasets", "processed")
file_path_State.Names <- file.path(PROCESSED_PATH, "State.Names.csv")

air_input <- function(year, name) {
  file_path <- file.path(RAW_PATH, name, paste0(name,"_", year, ".csv"))
  df <- read.csv(file_path) %>% 
    select(State.Name, Date.Local, Parameter.Name, Arithmetic.Mean, X1st.Max.Value)
  
  df$State.Name <- df$State.Name %>% 
    sapply(function(s) {
      if (s == "District Of Columbia") {
        "District of Columbia"
      } else {
        s
      }
    }) %>% as.character
  df <- df %>% filter(!(State.Name %in% c("Puerto Rico", "Virgin Islands", 
                                        "Country Of Mexico")))
  df$Date.Local <- df$Date.Local %>% as.Date
  df
}

compatibility <- function(df, State.Names) {
  loc <- df$State.Name %>% unique
  if (all(loc %in% State.Names)) {
    cat("State.Name compatibility.\n")
  } else {
    cat("State.Name incompatibility.\n")
  }  
}

State.Names <- read.table(file_path_State.Names) %>% getElement("V1")

df_LEAD <- map_dfr(START_YEAR:END_YEAR, function(year) air_input(year, "daily_LEAD"))
compatibility(df_LEAD, State.Names)
write_parquet(df_LEAD, file.path(PROCESSED_PATH, "supplementary_LEAD.parquet"))
rm(df_LEAD)
gc()

df_NONOxNOy <- map_dfr(START_YEAR:END_YEAR, function(year) air_input(year, "daily_NONOxNOy"))
compatibility(df_NONOxNOy, State.Names)
write_parquet(df_NONOxNOy, file.path(PROCESSED_PATH, "supplementary_NONOxNOy.parquet"))
rm(df_NONOxNOy)
gc()

df_VOCS <- map_dfr(START_YEAR:END_YEAR, function(year) air_input(year, "daily_VOCS"))
compatibility(df_VOCS, State.Names)
write_parquet(df_VOCS, file.path(PROCESSED_PATH, "supplementary_VOCS.parquet"))
rm(df_VOCS)
gc()

df_HAPS <- map_dfr(START_YEAR:END_YEAR, function(year) air_input(year, "daily_HAPS"))
compatibility(df_HAPS, State.Names)
write_parquet(df_HAPS, file.path(PROCESSED_PATH, "supplementary_HAPS.parquet"))
rm(df_HAPS)
gc()
