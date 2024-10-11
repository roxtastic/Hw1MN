function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)
    %truths - valorile reale
    %probabilities - probabilitatile calculate

    %Initializare
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    %Pasul de epsilon
    stepsize = (max(probabilities) - min(probabilities)) / 1000;
    %Definim intervalele in care vom imparti intervalul de valori al densitatii probabilitatii
    %Scaderea din paranteze calculeaza intervalul de valori cautat
    %Impartind acest interval la 1000, obtinem o granularitate pentru a acoperi toate valorile posibile obtinute anterior

    % Calculul celor mai bune epsilon, F1, precizie si recall asociate
    for epsilon = min(probabilities):stepsize:max(probabilities)
        predictions = probabilities < epsilon;
        [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);

        precision = true_positives / (true_positives + false_positives);
        recall = true_positives / (true_positives + false_negatives);

        F1 = (2 * precision * recall) / (precision + recall);

        % Actualizarea valorilor cele mai bune, daca valoarea masurii F1 este mai mare decat cea anterioara
        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
        end
    end
end

