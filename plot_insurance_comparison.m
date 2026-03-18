%creates figures comparing different types of insurance
function plot_insurance_comparison(T)
 
% Figure 1: Box plot
figure;
boxchart(T.InsuranceType, T.Amount);
xlabel('Insurance Type');
ylabel('Payout Amount ($)');
title('Payout Distribution by Insurance Type');
grid on;
 
% Figure 2: Bar chart with error bars
insTypes = categories(T.InsuranceType);
nIns     = numel(insTypes);
insMeans = zeros(nIns, 1);
insErr   = zeros(nIns, 1);   
 
for i = 1:nIns
    comp       = T.InsuranceType == insTypes{i};
    vals       = T.Amount(comp);
    insMeans(i) = mean(vals);
end
 
figure;
bar(insMeans);
xticklabels(insTypes);
xtickangle(30);
ylabel('Mean Payout ($)');
title('Mean Payout by Insurance Type');
grid on;
 
% Figure 3: Summary stats table
statsTable = groupsummary(T, 'InsuranceType', {'mean', 'median', 'std', 'min', 'max'});
 
disp(statsTable); 
end