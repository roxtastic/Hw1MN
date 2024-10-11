function retval = word_idx(distinct_wds)
    %Aceasta functie returneaza un dictionar care contine indicii asociati fiecarei etichete.
    retval = containers.Map(distinct_wds, 1:numel(distinct_wds));
end