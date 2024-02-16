# Preference and Perceived Competence of Actions and Inaction Agents by Gender in Decision-Making


## Overview
This paper investigates the correlation between decision-making preferences (inaction vs. action) and gender, aiming to replicate and expand on prior research on gender disparities in moral judgment.  The research explores decision-making preferences and perceived competence across genders, utilizing the Study 2 dataset from "Evaluations of Actions and Inaction Decision-makers in Risky Decisions Resulting in Negative Outcomes" by Adrien A. Fillion, Luna Strauch, and Gilad Feldman (2023). 

## File Structure
The repo is structured as:

- `inputs` contains the data sources used in analysis including the raw data and the LLM receipts. 
- `outputs` contains the cleaned dataset that was constructed.
- `outputs` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. It also includes the replication code of the original paper.
- `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run
- Run `scripts/01-download_data.R` to download raw data
- Run `scripts/02-clean_data.R to` generate cleaned data
- Run `outputs/paper/paper.qmd` to generate the PDF of the paper

## Statement on LLM usage
LLMs were used for some aspects of the code; particularly in the data simulation script (00_simulate_data.R) and the data cleaning script (02_clean_data.R). The LLM used was ChatGPT. Receipts are available in the `inputs/llm` folder.
