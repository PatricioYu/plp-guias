/*
% Definir los siguientes predicados, usando member y/o append según sea conveniente:
*/

/*
% i. intersección(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones de las 
% listas L1 y L2, respetando en L3 el orden en que aparecen los elementos en L1.

% partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto. 
% Si L tiene menos de N elementos el predicado debe fallar. ¿Cuán reversible es este
% predicado? Es decir, ¿qué parámetros pueden estar indefinidos al momento
% de la invocación?
*/
interseccion(_, [], []).
interseccion([], _, []).
interseccion(L1, [H|T], [HR|TR]) :- member(H, L1), H = HR, interseccion(L1, T, TR).
interseccion(L1, [H|T], L3) :- not(member(H, L1)), interseccion(L1, T, L3).

partir(N, L, L1, L2) :-
    length(L, TamL),
    N =< TamL,
    N >= 0,
    length(L1, N),
    prefix(L1, L),
    M is TamL - N,
    length(L2, M),
    append(_, L2, L).

/*
% ii. borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X 
% de la lista ListaOriginal.
*/
borrar([], _, []).
borrar([H|T], X, Rs) :- H = X, borrar(T, X, Rs).
borrar([H|T], X, [H|RT]) :- H \= X, borrar(T, X, RT).

/*
% iii. sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.
*/
sacarDuplicados([], []).
sacarDuplicados([H|T], [H|RT]) :- not(member(H, T)), sacarDuplicados(T, RT).
sacarDuplicados([H|T], RT) :-
    member(H, T), 
    !, 
    borrar(T, H, TSinH), 
    sacarDuplicados(TSinH, RT).

/*
% iv. permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1. 
% ¿Hay una manera más eficiente de definir este predicado para cuando L2 está instanciada?
*/
permutacion([], []).
permutacion(L1, [H|T]) :-
    append(A, [H|B], L1),
    append(A, B, R),
    permutacion(R, T).

/*
% v. reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥ 1)
% de cualquier longitud -incluso vacías- tales que al concatenarlas se obtiene la lista L.
*/
reparto(L, 1, [L]).
reparto(L, N, [H|T]) :-
    N > 1,
    append(H, R, L),
    M is N - 1,
    reparto(R, M, T).

/*
% vi. repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas de
% LListas puede ser vacía, y la longitud de LListas puede variar.
*/
repartoSinVacias(L, 1, [L]).
repartoSinVacias(L, N, [H|T]) :-
    N > 1,
    append(H, R, L),
    H \= [],
    R \= [],
    M is N - 1,
    repartoSinVacias(R, M, T).