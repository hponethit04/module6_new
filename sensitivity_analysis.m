function sensitivity_analysis(T)

    % Model Specification Sensitivity
 
    models = {
        'LogAmount ~ Age + Severity + Attorney + Specialty'; % base regression
        'LogAmount ~ Age + Severity + Attorney + Specialty + InsuranceType'; % +insurance
        'LogAmount ~ Age + Severity + Attorney + Specialty + Gender', '+ Gender'; % +gender
        'LogAmount ~ Age + Severity + Attorney + Specialty + MaritalStatus'; %+marital status
        'LogAmount ~ Age + Severity + Attorney + Specialty + InsuranceType + Gender + MaritalStatus'; %all
    };

    for i = 1:height(models)
        mdl = fitlm(T, models{i,1});
        disp(mdl.Coefficients);
    end

    % Outlier Sensitivity 

    thresholds = [0.99, 0.97, 0.95];   % remove top 1%, 3%, 5%
    base_mdl   = fitlm(T, 'LogAmount ~ Age + Severity + Attorney + Specialty');
    disp(base_mdl.Coefficients);

    for i = 1:length(thresholds)
        cutoff   = quantile(T.LogAmount, thresholds(i));
        T_trim   = T(T.LogAmount <= cutoff, :);
        mdl_trim = fitlm(T_trim, 'LogAmount ~ Age + Severity + Attorney + Specialty');
        disp(mdl_trim.Coefficients);
    end

end