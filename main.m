run('load_and_clean.m');

fprintf('\nSummary Stats by Attorney Type\n');
print_summary_stats(T, 'Attorney');

fprintf('\nSummary Stats by Insurance Type\n');
print_summary_stats(T, 'InsuranceType');

fprintf('\nSummary Stats by Specialty\n');
print_summary_stats(T, 'Specialty');

fprintf('\nPairwise Correlations with Payout Amount\n');
print_corr('Severity vs Amount',      T.Severity,     T.Amount);
print_corr('Age vs Amount',           T.Age,          T.Amount);
print_corr('Attorney vs Amount',      T.Attorney,     T.Amount);
print_corr('MaritalStatus vs Amount', T.MaritalStatus,T.Amount);

fprintf('\nVariable Correlation Matrix\n');
cor_table = computeCorrelationMatrix(T);
disp(cor_table);

fprintf('\nGenerating Attorney Comparison Plots\n');
plot_attorney_comparison(T);

fprintf('\nGenerating Insurance Comparison Plots\n');
plot_insurance_comparison(T);

fprintf('\nBase Regression Model\n');
mdl = run_regression(T);

fprintf('\nSensitivity Analysis\n');
sensitivity_analysis(T);

fprintf('\nAnalysis complete.\n');