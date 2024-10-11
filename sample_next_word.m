function probs = sample_next_word(text, words_idx, k_secv_idx, k, stoch)
    %returneaza probabilitatile asociate cu ultima k-secventa din text.
    ultima_k_secventa = text(end - k + 1:end);
    idx = k_secv_idx(ultima_k_secventa);
    probs = stoch(idx, :);
end