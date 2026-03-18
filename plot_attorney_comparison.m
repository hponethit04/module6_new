
% creates figures comparing different stats for private vs public attorney
function plot_attorney_comparison(T)

% Figure 1: Box plot
figure;
boxchart(T.Attorney, T.Amount);
xticklabels({'No Private Attorney', 'Private Attorney'});
xlabel('Attorney Type');
ylabel('Payout Amount ($)');
title('Payout Distribution by Attorney Type');
grid on;
 
% Figure 2: Bar chart 
private    = T.Amount(T.Attorney == '1');
notPrivate = T.Amount(T.Attorney == '0');
 
figure;
bar([mean(private), mean(notPrivate)]);
xticklabels({'Private Attorney', 'No Private Attorney'});
ylabel('Mean Payout ($)');
title('Mean Payout by Attorney Type');
grid on;
 
% Figure 3: Summary stats table 
statsTable = groupsummary(T, 'Attorney', {'mean', 'median', 'std', 'min', 'max'});

display(statsTable);
 
end


