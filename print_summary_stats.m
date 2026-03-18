%prints summary stats of a variable
function print_summary_stats(T, groupVar)

statsTable = groupsummary(T, groupVar, {'mean', 'median', 'std', 'min', 'max'});

disp(statsTable);

end




