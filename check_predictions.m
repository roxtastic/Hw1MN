function [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths)
% Parametri de intrare:
% predictions - predictiile modelului
% truths - valorile adevarate

% Parametri de iesire:
% false_positives - numarul de pozitive false
% false_negatives - numarul de negative false
% true_positives - numarul de pozitive adevarate

false_positives = sum((predictions == 1) & (truths == 0));
%Expresia returneaza un vector de valori de tip bool. Iau valoarea true pentru cazurile in care predictia este 1 si adevarul este 0, iar altfel iau valoarea false.
%Dupa, se calculeaza suma valorilor true din vectorul rezultat de la pasul anterior. Astfel, numarul de true va fi numarul de predictii pozitive false.
false_negatives = sum((predictions == 0) & (truths == 1));
%Pentru expresia 2, este opusul, si facem suma. Numarul de true va fi numarul de predictii negative false.
true_positives = sum((predictions == 1) & (truths == 1));
%Pentru expresia 3, facem suma de true pentru predictii adevarate pozitive.
end