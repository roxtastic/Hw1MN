function [a] = get_prediction_params(K, y, lambda)
    %Aceasta functie estimeaza parametrii folositi pentru evaluare
    %Functia primeste ca parametri matricea nucleului, valorile evaluate pentru intrarile pe care K a fost construit si parametrul lambda folosit pentru regularizare. 
    %Functia returneaza vectorul coloana a, care contine estimarile parametrilor folositi pentru evaluare prin Cholesky
    
    n = size(K, 1);
    A = lambda * eye(n) + K;
    L = cholesky(A);
    P = get_lower_inverse(L);
    a = lambda * A^(-1)*y;
end
