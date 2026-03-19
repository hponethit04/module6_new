**Overview**
This project analyzes a medical malpractice dataset to identify factors that may influence payout amounts. With The analysis covers descriptive statistics, correlation diagnostics, data visualizations and regression models. Our project attempts to analyze the various factors that might influence the payout amount of malpractice cases.

**Dataset**
The dataset contains 79210 medical malpractice cases with the following variables: <br />
Amount - Amount of the claim payment in dollars
Severity - The severity rating of damage to the patient, from 1 (emotional trauma) to 9 (death)
Age - Age of the claimant in years
Private Attorney - Whether the claimant was represented by a private attorney
Marital Status - Marital status of the claimant
Specialty - Specialty of the physician involved in the lawsuit
Insurance - Type of medical insurance carried by the patient
Gender - Patient Gender

**Project Structure**
main.m- main script to execute full analysis
load_and_clean.m- loads cvs and prepares data
print_summary_stats.m- summary statistics by group
print_corr.m- pairwise correlation between variables
computeCorrelationMatrix.m- full correlation matrix across all independent variables
plot_attorney_comparison.m- visualizations comparing outcomes across attorney type
plot_insurance_comparison.m- visualizations comparing outcomes across insurance
run_regression.m- base linear regression model
sensitivity_analysis.m- model specification and robustness checks

**Proposal Review**
Modular code- every analysis step is its own .m file and can taken in other data as well if needed
Built in MATLAB functions- the project makes extensive use of builtin functions like fitlm, corrcoef and groupsummary
Descriptive statistics by group- the project analyzes within groups and outputs descriptive statistics for each group
Correlation analysis- print_corr and computeCorrelationMatrix performs correlation analysis between variables
Regression analysis- run_regression and sensitivity_analysis implements a regression with robustness checks
Combining into single script- main.m combines all functions into a single executable script with documentation
