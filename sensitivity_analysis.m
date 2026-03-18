function sensitivity_analysis(T)

    % Model Specification Sensitivity
    % different models to see how coefficients changes 
    models = {
        'LogAmount ~ Age + Severity + Attorney + Specialty'; 
        'LogAmount ~ Age + Severity + Attorney + Specialty + InsuranceType'; 
        'LogAmount ~ Age + Severity + Attorney + Specialty + Gender';
        'LogAmount ~ Age + Severity + Attorney + Specialty + MaritalStatus'; 
        'LogAmount ~ Age + Severity + Attorney + Specialty + InsuranceType + Gender + MaritalStatus'; 
    };

    for i = 1:height(models)
        mdl = fitlm(T, models{i,1});
        disp(mdl.Coefficients);
    end

    % Outlier Sensitivity 
    % removes potential outliers to analyze how coefficients change

    thresholds = [0.99, 0.97, 0.95];   % remove top 1%, 3%, 5%
    labels = {'Top 1% removed', 'Top 3% removed', 'Top 5% removed'};
    base_mdl   = fitlm(T, 'LogAmount ~ Age + Severity + Attorney + Specialty');
    disp(base_mdl.Coefficients);

    for i = 1:length(thresholds)
        cutoff   = quantile(T.LogAmount, thresholds(i));
        T_trim   = T(T.LogAmount <= cutoff, :);
        mdl_trim = fitlm(T_trim, 'LogAmount ~ Age + Severity + Attorney + Specialty');
        fprintf('\n%s (n=%d)\n', labels{i}, height(T_trim));
        disp(mdl_trim.Coefficients);
    end

end