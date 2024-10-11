function probabilities = multivariate_gaussian(X, mean_values, variances)
  %Functia calculeaza densitatea probabilitatii pentru fiecare punct de date din X sub o distributie gaussiana
  %Memorez nr de linii al matricei de varianta
  n = size(variances, 1);

  %Calculam termenul constant al matricei de varianta
  constant_term = (2*pi)^(n/2) * det(variances)^(1/2);

  % Calculam termenul exponential pentru fiecare punct de date din X
  exponent_term = zeros(size(X, 1), 1);
  for i = 1:size(X, 1)
  %Memoram linia pe care ne aflam in parcurgere intr-o variabila
    x_i = X(i, :);
    %Centram valorile liniei, prin scaderea mediilor pt fiecare linie
    centered_x = x_i - mean_values;
    %Calculam termenul exponential
    exponent_term(i) = -0.5 * centered_x * inv(variances) * centered_x';
  end

  %Calculam densitatea probabilitatii pentru fiecare dintre punctele de date
  probabilities = (1 / constant_term) * exp(exponent_term);
end
