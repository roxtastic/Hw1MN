function [mean_values, variances] = estimate_gaussian(X)

  %Memoram dimensiunea lui X
  [m, n] = size(X);

  %Calculam mediile pentru fiecare coloana din dataset
  mean_values = mean(X);

  %Scad mediile din fiecare valoare a dataset-ului(in functie de coloana pe care se afla numarul)
  %("centram datele" - motiv pentru care am notat matricea obtinuta prin scadere cu Xcentr)
  Xcentr = X - mean_values;

  %Calculam matricea de varianta 
  variances = (1/m) * Xcentr' * Xcentr;

endfunction
