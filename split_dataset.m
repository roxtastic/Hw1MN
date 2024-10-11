function [X_train, y_train, X_pred, y_pred] = split_dataset(X, y, percentage)
    % Aceasta functie imparte setul de date in seturi de antrenare si de testare.

    % Numarul total de date
    num_data = size(X, 1);
    
    % Numarul de date pentru setul de antrenare
    split_index = round(percentage * num_data);
    
    % Setul de antrenare
    X_train = X(1:split_index, :);
    y_train = y(1:split_index, :);
    
    % Setul de testare
    X_pred = X(split_index + 1:end, :);
    y_pred = y(split_index + 1:end, :);
end