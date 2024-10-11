## Tema 1 - MN ##
## Tololoi Ilinca-Roxana, 311CB ##

## Task 1 - Anomaly Detection ##

## 1. estimate_gaussian.m ## 
    Pentru scriptul estimate_gaussian, am memorat mai intai dimensiunea matricei date. 
    Dupa, am calculat mediile fiecarei coloane din matricea X si in continuare am creat o noua matrice cu date "centrate" (rezultatul scaderii mediei elementelor de pe coloana k din fiecare element in parte al coloanei k, cu k fiind oricare coloana din matricea X).
    La final, se calculeaza matricea de varianta.

## 2. multivariate_gaussian.m ##
    In acest script, este calculata densitatea de probabilitate pentru fiecare punct de date dintr-o matrice X, sub o distributie gaussiana multivariata.
    Mai intai, se memoreaza numarul de linii al matricei de varianta. Dupa, se calculeaza termenul constant al matricei de varianta.
    Apoi, se calculeaza termenul exponential pentru fiecare punct de date din X.
    In final, ajungem la densitatea de probabilitate pentru fiecare punct de date.

## 3. check_predictions.m ##
    In check_predictions.m, se verifica valenta fiecarei predictii in parte.
    Aceasta functie primeste doua vectori: predictions (predictiile modelului) si truths (valorile adevarate).
    Functia returneaza trei valori:
    false_positives: nr de pred pozitive false
    false_negatives: nr de pred negative false
    true_positives: nr de pred pozitive corecte
    In interiorul functiei:
    false_positives - suma cazurilor in care predictia modelului este 1, dar valoarea adevarata este 0.
    false_negatives - suma cazurilor in care predictia modelului este 0, dar valoarea adevarata este 1.
    true_positives - suma cazurilor in care predictia modelului este 1 si valoarea adevarata este 1.

## 4. optimal_threshold.m ## 
    Functia ne returneaza valorile pentru precizia si recall-ul asociate, cat si pentru epsilonul si F1-ul optimi.
    In primul rand, stabilim pasul de epsilon, astfel definind intervalele in care impartim intervalul  de valori al densitatii probabilitatii.
    Dupa, vom parcurge toate valorile posibile ale epsilonului, incepand de la valoarea minima a densitatii probabilitatii pana la valoarea maxima, cu un pas egal cu stepsize.
    Pentru fiecare valoare de epsilon, se genereaza un vector de predictii, unde un exemplu este clasificat ca pozitiv daca densitatea probabilitatii este mai mica decat epsilon si ca negativ in caz contrar.
    Apoi, se compara predictiile cu valorile adevarate si se calculeaza numarul de pozitive false, negative false si adevarate pozitive.
    La final, calculam precizia si exhaustivitatea pentru fiecare valoare de epsilon, dar si masura F1.
    Daca valoarea masurii F1 este mai mare decat cea anterioara, valoarea curenta a lui epsilon, precizia si exhaustivitatea asociate sunt actualizate.

## 5. identify_outliers.m ## 
    Pentru inceput, estimam media si varianta setului de date prin estimate_gaussian.
    Dupa, calculam densitatea probabilitatii cu multivariate_gaussian.
    Apoi, determinam valoarea optima pentru epsilon si alte metrici de evaluare prin optimal_threshold.
    La final, outlierii ii vom afla prin functia find, care ne va ajuta sa selectam cazurile in care probabilitatea calculata este mai mica decat valoarea optima a lui epsilon, caz in care avem un outlier.


## Task 2 - Kernel Regression ##

## 1. linear_kernel.m ## 
    Calculeaza conform formulei din continutul teoretic.

## 2. polynomial_kernel.m ## 
    Calculeaza conform formulei din continutul teoretic.

## 3. gaussian_kernel.m ## 
    Calculeaza conform formulei din continutul teoretic.

## 4. build_kernel.m - avem comentarii ## 

## 5. cholesky.m ##
    Implementarea factorizarii LU de tip Cholesky, predata si la curs.

## 6. get_lower_inverse.m ##
    Inverseaza o matrice inferior triunghiulara (lower) folosind un algoritm de eliminare gaussiana.

## 7. get_prediction_params.m ##
    Functia get_prediction_params estimeaza parametrii folositi pentru evaluare. 
    Mai intai, primeste ca parametri matricea nucleului, valorile evaluate pentru intrarile pe care K a fost construit si parametrul lambda folosit pentru regularizare. 
    Dupa, returneaza vectorul coloana a, care contine estimarile parametrilor folositi pentru evaluare prin Cholesky.

## 8. conjugate_gradient.m ##
    Aceasta functie implementeaza un algoritm pentru metoda gradientului conjugat, avand parametri:
    - A (o matrice pozitiv semi-definita)
    - b (vectorul coloana rezultat al sistemului Ax = b)
    - tol (toleranta maxima acceptata pentru ca o solutie sa fie valida)
    - max_iter (numarul maxim de iteratii pentru rezolvarea sistemului)
    Acest cod implementeaza metoda gradientului conjugat pentru a rezolva un sistem de ecuatii liniare de forma Ax = b;

## 9. get_predictions_params_iterative.m ##
    Aceasta functie este utilizata pentru estimarea parametrilor folositi la evaluare.
    Functia primeste ca parametri:
    - matricea de kernel
    - valorile evaluate pentru inputurile pe care a fost construit K 
    - parametrul lambda folosit pentru regularizare
    Functia intoarce vectorul coloana a, ce contine estimarile parametrilor folositi la evaluare(folosind metoda gradientului conjugat).

## 10. split_dataset.m ##
    In primul rand, se calculeaza numarul total de date din setul de date.
    Dupa, se afla indexul la care se face impartirea intre setul de antrenare si cel de testare, in functie de procentul specificat.
    Apoi, se definesc seturile de antrenare (X_train si y_train) ca primele split_index date din seturile X si y.
    In final, se definesc seturile de testare (X_pred si y_pred) ca datele de la split_index + 1 pana la sfarsitul seturilor X si y.

## 11. eval_value.m ## 
    Functia eval_value este utilizata pentru calcularea estimarii produse de model.
    Pentru:
    - un vector x oarecare ca input (vector linie), 
    - X (toti vectorii folositi pentru construirea modelului), 
    - f (functia de kernel), 
    - f_param (al treilea parametru al functiei de kernel)
    - a (estimarea parametrilor folositi la evaluare) 
    trebuie sa returnam predictia facuta pentru datele de intrare reprezentate de x.



## Task 3 - Stochastic Text Generation ##

## 1. distinct_words.m ##
    Aceasta functie returneaza token-urile sortate si unice.

## 2. k_secv.m ##
    Functia primeste un vector unidimensional A si un parametru k, si returneaza un cell array B format din k-secvente ale elementelor lui A.
    Variabila B este initializata ca un cell array cu o lungime de length(A) - k + 1.
    Pentru fiecare secventa de lungime k din vectorul A, functia concateneaza elementele si le adauga la cell array B.
    Rezultatul returnat contine k-secventele elementelor lui A.

## 3. distinct_k_secv.m ##
    Aceasta functie returneaza k-secventele sortate si unice.

## 4. word_idx.m ##
    Aceasta functie returneaza un dictionar care contine indicii asociati fiecarei etichete.

## 5. k_secv_idx.m ## 
    Functia initializeaza un dictionar gol.

## 6. stochastic_matrix.m ##
    Functia construieste o matrice stocastica folosind k-secventele si cuvintele corespunzatoare lor.
    Mai intai, initializeaza matricea stocastica cu zero. Apoi, parcurge fiecare k-secventa din corpus.
    Pentru fiecare k-secventa, se obtine cuvantul care urmeaza dupa ea si gaseste indicele corespunzator in dictionar.
    In continuare, actualizeaza matricea stocastica, setand 1 la indicele corespunzator cuvantului.
    La final, normalizeaza fiecare rand al matricei stocastice, impartind fiecare rand la suma elementelor sale si returneaza matricea stocastica completata.

## 7. sample_next_word.m ##
    Functia returneaza probabilitatile asociate cu ultima k-secventa din text.

