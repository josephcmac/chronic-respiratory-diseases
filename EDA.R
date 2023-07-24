library(tidyverse)
library(arrow)

ROOT_PATH <- read.csv("ROOT_PATH.txt", header = F) %>% getElement("V1")
PROCESSED_PATH <- file.path(ROOT_PATH, "datasets", "processed")

df <- read_parquet(file.path(PROCESSED_PATH, "supplementary_NONOxNOy.parquet"))
( df$Parameter.Name %>% as.factor %>% summary / nrow(df) ) %>% sort

df <- read_parquet(file.path(PROCESSED_PATH, "supplementary_LEAD.parquet"))
( df$Parameter.Name %>% as.factor %>% summary / nrow(df) ) %>% sort

df <- read_parquet(file.path(PROCESSED_PATH, "supplementary_VOCS.parquet"))
( df$Parameter.Name %>% as.factor %>% summary / nrow(df) ) %>% sort

df <- read_parquet(file.path(PROCESSED_PATH, "supplementary_HAPS.parquet"))
( df$Parameter.Name %>% as.factor %>% summary / nrow(df) ) %>% sort


