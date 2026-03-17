%script for loading and cleaning data


T = readtable('/Users/hponehtoo/Desktop/matlab mod 6/module6_new/medicalmalpractice.csv')

% Standardize names
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'amount', 'Amount');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'age', 'Age');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'severity','Severity');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'specialty','Specialty');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'Insurance','InsuranceType');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'PrivateAttorney', 'Attorney');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'marital_status','MaritalStatus');
T.Properties.VariableNames = strrep(T.Properties.VariableNames, 'gender', 'Gender');

% Convert text columns 
T.Specialty = categorical(T.Specialty);
T.InsuranceType = categorical(T.InsuranceType);
T.Attorney = categorical(T.Attorney);
T.MaritalStatus = categorical(T.MaritalStatus);
T.Gender = categorical(T.Gender);

T.LogAmount = log(T.Amount);
