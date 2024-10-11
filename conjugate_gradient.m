function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    % Aceasta functie implementeaza un algoritm pentru metoda gradientului conjugat,
    % avand parametri A (o matrice pozitiv semi-definita), b (vectorul coloana rezultat
    % al sistemului Ax = b), tol (toleranta maxima acceptata pentru ca o solutie sa fie
    % valida), max_iter (numarul maxim de iteratii pentru rezolvarea sistemului).

    x = x0; %initializam solutia
    r = b - A * x; %initializam reziduul
    p = r; %Alegem directia de cautare initiala
    rsold = r' * r; %Calculam patratul normei reziduului initial

    for i = 1:max_iter
        Ap = A * p; %Calculam produsul matrice-vector dintre matricea A si directia de cautare p.
        alpha = rsold / (p' * Ap); %calculam marimea pasului
        x = x + alpha * p; %actualizam solutia
        r = r - alpha * Ap; %actualizam reziduul
        rsnew = r' * r; %calculam noul patrat al normei reziduului
        if sqrt(rsnew) < tol %daca am atins precizia pe care o vrem
            break; %in caz afirmativ, iesim din bucla
        end
        p = r + (rsnew / rsold) * p;
        rsold = rsnew;
    end
end