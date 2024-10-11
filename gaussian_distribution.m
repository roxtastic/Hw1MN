function probability = gaussian_distribution(X, mean_value, variance)
  % This function calculates the probability density for each data point in X under a Gaussian distribution.
  n = size(variance, 1);

  % Calculate the constant term
  constant_term = (2*pi)^(n/2) * det(variance)^(1/2);

  % Calculate the exponent term for each data point
  exponent_term = zeros(size(X, 1), 1);
  for i = 1:size(X, 1)
    x_i = X(i, :);  % Extract the i-th data point
    centered_x = x_i - mean_value;
    exponent_term(i) = -0.5 * centered_x * inv(variance) * centered_x';
  end

  % Calculate the probability density for each data point
  probability = (1 / constant_term) * exp(exponent_term);
end