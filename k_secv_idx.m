function retval = k_secv_idx(distinct_k_sec)
    % Initializeaza un dictionar gol
    retval = containers.Map(distinct_k_sec, 1:length(distinct_k_sec));
end
