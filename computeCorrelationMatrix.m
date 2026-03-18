% creates a matrix showing correlation between all dependent variables
% used to assess collinearity of variables

function cor_table = computeCorrelationMatrix(T)
    X = T(1:height(T), 2:width(T));
    X.Specialty     = grp2idx(X.Specialty);
    X.InsuranceType = grp2idx(X.InsuranceType);
    X.Gender        = grp2idx(X.Gender);
    X.Attorney      = grp2idx(X.Attorney);
    X.MaritalStatus = grp2idx(X.MaritalStatus);

    Y          = table2array(X);
    cor_matrix = corrcoef(Y);

    varNames  = {'Severity', 'Age', 'Attorney', 'MaritalStatus', 'Specialty', 'Insurance', 'Gender'};
    cor_table = array2table(cor_matrix, 'VariableNames', varNames, 'RowNames', varNames);
end
