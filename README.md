# Evaluation of Preference and Perception of Decision Making


## Overview

## File Structure
The repo is structured as:

- **input** contains the data sources used in analysis including the raw data and the LLM receipts. 
- **outputs** contains the cleaned dataset that was constructed.
- **outputs** contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
- **scripts** contains the R scripts used to simulate, download and clean data.

## How to Run
- Run **scripts/01-download_data.R** to download raw data
- Run **scripts/02-clean_data.R to** generate cleaned data
- Run **outputs/paper/paper.qmd** to generate the PDF of the paper

## Statement on LLM usage
LLMs were used for some aspects of the code,particularly in the data simulation script (00_simulate_data.R). The LLM used was ChatGPT. Receipts are available in the **inputs** folder.
