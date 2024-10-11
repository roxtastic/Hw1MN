function outliers = identify_outliers(X, yval)
    % Estimam media si varianta setului de date
    [mean_values, variances] = estimate_gaussian(X);
    
    % Calculam densitatea probabilitatii
    probabilities = multivariate_gaussian(X, mean_values, variances);
    
    % Determinam valoarea optima pentru epsilon si alte metrici de evaluare
    [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);
    
    % Identificam outlierii bazandu-ne pe valoarea optima a lui epsilon
    outliers = find(probabilities < epsilon);
end