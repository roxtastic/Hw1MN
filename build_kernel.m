function [K] = build_kernel(X, f, f_param)
    % Functia construieste matricea kernel.
    
    % Obtinem numarul de puncte
    n = size(X, 1);
    
    % Initializam matricea kernel cu zero
    K = zeros(n, n);
    
    % Parcurgem toate perechile de puncte
    for i = 1:n
        for j = i:n  % Parcurgem doar j din i pentru a umple jumatatea inferioara a matricei
            % Calculam valoarea kernelului pentru fiecare pereche de puncte
            K(i, j) = f(X(i, :), X(j, :), f_param);
            % Kernelul este simetric, deci completam si jumatatea superioara a matricei
            K(j, i) = K(i, j);
        end
    end
end
