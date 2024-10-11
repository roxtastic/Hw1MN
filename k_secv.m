function B = k_secv(A, k)
    % Initializeaza array-ul de celule de iesire
    B = cell(length(A) - k + 1, 1);
    
    % Genereaza k-secventele
    for i = 1:length(A) - k + 1
        % Concateneaza elementele sub-tabloului
        seq = '';
        for j = 1:k
            seq = [seq, A{i+j-1}];
        end
        B{i} = seq;
    end
end
