# Data Cleaning for Chronic Respiratory Diseases and Air Toxicity

## Contents of the Repository

Here is a brief overview of the files included in this repository and their purposes:

- `data-cleaning-main.R`: This R script performs the primary data cleaning and processing tasks, generating the following files: `sample_submission.csv`, `solution.csv`, `State.Names.csv`, `test.csv`, and `train.csv`. These files are stored in the `datasets/processed` directory.

- `data-cleaning-supplementary.R`: This R script generates additional data files which can be used to supplement the training of the model. The files generated are: `supplementary_LEAD.parquet`, `supplementary_NONOxNOy.parquet`, `supplementary_VOCS.parquet`, and `supplementary_HAPS.parquet`. These files are stored in the `datasets/processed` directory.

- `ROOT_PATH.txt`: This file should contain the path to the directory where you have cloned this GitHub repository on your local machine.

- `example.ipynb`: This Jupyter notebook provides an example of a simple predictive model using the cleaned and processed data.

- `EDA.R`: This R script performs a quick exploratory data analysis (EDA) of the supplementary data files mentioned above.

- `/datasets/raw`: This directory should contain the raw data downloaded by the user. The necessary data sources are: `daily_HAPS`, `daily_LEAD`, `daily_NONOxNOy`, `daily_VOCS`, and `IHME-GBD_2019_DATA-1b44dc17-1`.

## Getting Started

To start using this repository, clone the repository to your local machine. Then, download the necessary raw data and place it in the `datasets/raw` directory.

Before running the R scripts, make sure to edit the `ROOT_PATH.txt` file to contain the path to the directory where you have cloned the repository.

## Usage

To perform the data cleaning and preprocessing tasks, run, first the script `data-cleaning-main.R` and, second, the script `data-cleaning-supplementary.R`. 

You can then use the generated .csv and .parquet files in your models or analyses. 

An example of a simple predictive model can be found in the `example.ipynb` notebook. 

For a quick exploratory data analysis of the supplementary data, you can run the `EDA.R` script.


## Data Source

### Public Health Data

The public health data for this project comes from the Global Burden of Disease (GBD) Results tool. The data specifically focuses on chronic respiratory diseases in the elderly.


#### Citation

**GBD Results tool:**
*Global Burden of Disease Collaborative Network.*
*Global Burden of Disease Study 2019 (GBD 2019) Results.*
Seattle, United States: Institute for Health Metrics and Evaluation (IHME), 2020.
Available from: [https://vizhub.healthdata.org/gbd-results?params=gbd-api-2019-permalink/4236f14fa0a1ca16f5588ff87364c591](https://vizhub.healthdata.org/gbd-results?params=gbd-api-2019-permalink/4236f14fa0a1ca16f5588ff87364c591)

### Air Quality Data

The air quality data for this project comes from the United States Environmental Protection Agency (EPA). The data specifically focuses on toxics, precursors, and lead in the air.

#### Citation

**AQS Data:**
*United States Environmental Protection Agency (EPA).* 
*Toxics, Precursors, and Lead Data.* 
United States Environmental Protection Agency, 2023. 
Available from: [https://aqs.epa.gov/aqsweb/airdata/download_files.html](https://aqs.epa.gov/aqsweb/airdata/download_files.html)


## License

This project is licensed under the MIT License.