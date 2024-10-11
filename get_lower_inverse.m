function [P] = get_lower_inverse(L)
    % Aceasta functie inverseaza o matrice inferior triunghiulara (lower) folosind un algoritm de eliminare gaussiana.
    
    n = size(L, 1);
    P = eye(n);

    for k = 1:n
        for j = 1:k-1
            P(k, :) = P(k, :) - L(k, j) * P(j, :);
        end
        P(k, :) = P(k, :) / L(k, k);
    end
end