function unique_cell_array = distinct_k_secv(cell_array)
    %Aceasta functie returneaza k-secventele sortate si unice.
    cell_array = unique(cell_array);
    cell_array = sort(cell_array);
    unique_cell_array = cell_array;
end