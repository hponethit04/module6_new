function mdl = run_regression(T)
  
% fits a linear model predicting log-transformed payout amount
% chose predictors based on domain relevance 
% age - age can affect payout based on a patient's health/finances
% severity - most direct driver of payout
% attorney - private cases most likely pursue higher payouts

mdl = fitlm(T, 'LogAmount ~ Age + Severity + Attorney + Specialty');
 
disp(mdl.Coefficients);
 
end