# Load required packages
library(tidyverse)
library(rlang)

# Define constants
State.Names_train_size <- 30
ROOT_PATH <- read.csv("ROOT_PATH.txt", header = F) %>% getElement("V1")
RAW_PATH <- file.path(ROOT_PATH, "datasets", "raw")
PROCESSED_PATH <- file.path(ROOT_PATH, "datasets", "processed")
IHME_name <- "IHME-GBD_2019_DATA-1b44dc17-1"
file_path_IHME <- file.path(RAW_PATH, IHME_name, paste0(IHME_name, ".csv"))
file_path_train <- file.path(PROCESSED_PATH, "train.csv")
file_path_test <- file.path(PROCESSED_PATH, "test.csv")
file_path_sample_submission <- file.path(PROCESSED_PATH, 
                                         "sample_submission.csv")
file_path_solution <- file.path(PROCESSED_PATH, "solution.csv")
file_path_State.Names <- file.path(PROCESSED_PATH, "State.Names.csv")

clean_age <- function(x) {
  x %>%
    gsub("years", " ", .) %>%
    trimws
}

input_data <- function(file_path) {
  df <- read.csv(file_path) %>% 
    rename(Incidence = val, Age = age, Year = year) %>% 
    mutate(Age = Age %>% clean_age) %>% 
    rename(State.Name = location) %>% 
    select(State.Name, Year, Age, Incidence) %>% 
    arrange(State.Name, Year, Age)
  df
}


df <- input_data(file_path_IHME)

State.Names <- df$State.Name %>% unique
write.table(State.Names, file_path_State.Names, row.names=F, col.names = F)

State.Names_train <- State.Names %>% sample(size = State.Names_train_size,
                                            replace = T)
rm(State.Names)

train <- df %>% filter(State.Name %in% State.Names_train)
train$ID <- sapply(paste(train$State.Name, train$Year, train$Age, sep="-"), 
                   function(s) hash(s) %>% substring(1,7))

if (train$ID %>% unique %>% length == nrow(train)) {
  cat("No ID collapse for train.\n")
} else {
  cat("ID collapse for train.\n")
}
test <- df %>% filter(!(State.Name %in% State.Names_train))
test$ID <- sapply(paste(test$State.Name, test$Year, test$Age, sep="-"), 
                  function(s) hash(s) %>% substring(1,7))

if (test$ID %>% unique %>% length == nrow(test)) {
  cat("No ID collapse for test.\n")
} else {
  cat("ID collapse for test.\n")
}
rm(df)

train %>% select(ID, State.Name, Year, Age, Incidence) %>% 
  write.csv(file_path_train, row.names = F)
rm(train)

sample_submission <- test %>% select(ID)
sample_submission$Incidence <- rnorm(nrow(sample_submission), 0, 1)

write.csv(sample_submission, file_path_sample_submission, row.names = F)
solution <- sample_submission
rm(sample_submission)

solution$Incidence <- test$Incidence
solution$Usage <- sapply(test$State.Name, function(s)
  hash(s) %>% substr(1,1) %>% strtoi(16L)) %>% as.numeric %>% 
  sapply(function(x){ if (x %% 2 == 0) {
    "Private"
  } else {
    "Public"
  }})

write.csv(solution, file_path_solution, row.names = F)
rm(solution)

test %>% select(ID, State.Name, Year, Age) %>% 
  write.csv(file_path_test, row.names = F)

