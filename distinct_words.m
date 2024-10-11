function retval = distinct_words(tokens)
    %Aceasta functie returneaza token-urile sortate si unice.
    tokens = unique(tokens);
    tokens = sort(tokens);
    retval = tokens;
end