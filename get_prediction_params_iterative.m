function [a] = get_prediction_params_iterative(K, y, lambda)
    % Această funcție este utilizată pentru estimarea parametrilor folosiți la evaluare.
    % Funcția primește ca parametri matricea de kernel, valorile evaluate pentru
    % inputurile pe care a fost construit K și parametrul lambda folosit pentru
    % regularizare. Funcția întoarce vectorul coloană a ce conține estimările
    % parametrilor folosiți la evaluare (folosind metoda gradientului conjugat).
    
    n = size(K, 1);
    A = lambda * eye(n) + K;
    a0 = zeros(n, 1);
    tol = 1e-10;
    max_iter = 1000;
    a = conjugate_gradient(A, y, a0, tol, max_iter);
end