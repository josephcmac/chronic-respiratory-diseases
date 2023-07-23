# Chronic Respiratory Diseases Data Cleaning

## Introduction

Welcome to the "chronic-respiratory-diseases" repository! This project is dedicated to cleaning and preparing data for the Kaggle competition titled "Air Pollution and Chronic Respiratory Diseases." The objective of this competition is to analyze the relationship between air pollution and chronic respiratory diseases in the elderly.

## Data Source

### Public Health Data

The public health data for this project comes from the Global Burden of Disease (GBD) Results tool. The data specifically focuses on chronic respiratory diseases in the elderly. You can access the data through the following link:

[GBD Results - Chronic Respiratory Diseases](https://vizhub.healthdata.org/gbd-results?params=gbd-api-2019-permalink/4236f14fa0a1ca16f5588ff87364c591)


#### Usage Limitations

It is essential to understand that the data obtained from the GBD Results tool is intended for non-commercial purposes only. As we use this data for publication on the Kaggle website, we must adhere to the terms and conditions outlined in the data use agreement.

#### Citation

**GBD Results tool:**
*Global Burden of Disease Collaborative Network.*
*Global Burden of Disease Study 2019 (GBD 2019) Results.*
Seattle, United States: Institute for Health Metrics and Evaluation (IHME), 2020.
Available from: [https://vizhub.healthdata.org/gbd-results/](https://vizhub.healthdata.org/gbd-results/)

## Air Quality Data

The air quality data for this project comes from the United States Environmental Protection Agency (EPA). The data specifically focuses on the lead concentration in the air. You can access the data through the following link:

[AQS Data Mart - Lead Concentration](https://aqs.epa.gov/aqsweb/airdata/download_files.html)

### Usage Limitations

The data obtained from the AQS Data Mart is publicly available and free to use. However, any data that is used for publications or in any other way should provide the appropriate citation for the source.

### Citation

**AQS Data Mart:**
*United States Environmental Protection Agency (EPA).* 
*Toxics, Precursors, and Lead Data.* 
United States Environmental Protection Agency, 2023. 
Available from: [https://aqs.epa.gov/aqsweb/airdata/download_files.html](https://aqs.epa.gov/aqsweb/airdata/download_files.html)

## Data Cleaning and Preprocessing

This project includes cleaning, preprocessing, and combining the data from these two sources. The initial cleaning steps will focus on removing any irrelevant information and handling missing data. We will then preprocess the data to make it suitable for the required analysis. The final step will involve combining the datasets to create a single, unified dataset that captures the relationship between air pollution (specifically, lead concentration) and chronic respiratory diseases in the elderly.

Before using the scripts, write your root path into the file: ROOT_PATH.txt 

## License

This project is licensed under the [MIT License](LICENSE).