function pred = eval_value(x, X, f, f_param, a)
    % Aceasta functie este utilizata pentru calcularea estimarii produse de model.
    % Pentru un vector x oarecare ca input (vector linie), X (toti vectorii folositi
    % pentru construirea modelului), f (functia de kernel), f_param (al treilea parametru
    % al functiei de kernel) si a (estimarea parametrilor folositi la evaluare) trebuie
    % sa returnam predictia facuta pentru datele de intrare reprezentate de x.
    
    n = size(X, 1);
    pred = 0;
    for i = 1:n
        pred = pred + a(i) * f(X(i, :), x, f_param);
    end
end