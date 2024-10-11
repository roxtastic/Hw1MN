function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_idx, k_secv_idx, k)
    % Initializeaza matricea cu zero
    numWords = length(corpus_words);
    numSequences = length(k_secv_corpus);
    % Initializeaza matricea cu zero
    stochasticMat = zeros(numSequences, numWords);
    
    for i = 1:numSequences
        % Obtine k-secventa
        seq = k_secv_corpus{i};
        % Obtine cuvantul care urmeaza dupa k-secventa
        word = corpus_words{i + k};
        % Gaseste indicele cuvantului in dictionar
        word_index = words_idx(word);
        % Actualizeaza matricea stocastica
        stochasticMat(i, word_index) = 1;
    end
    % Normalizeaza fiecare rand
    for i = 1:numSequences
        stochasticMat(i, :) = stochasticMat(i, :) / sum(stochasticMat(i, :));
    end
    retval = stochasticMat;
end