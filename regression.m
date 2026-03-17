function mdl = run_regression(T)
 
T.LogAmount = T.Amount;
 
mdl = fitlm(T, 'LogAmount ~ Age + Severity + Attorney + Specialty');
 
disp(mdl.Coefficients);
 
end