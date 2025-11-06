/*
% Definir el predicado intercalar(L1, L2, L3), donde L3 es el resultado de intercalar
% uno a uno los elementos de las listas L1 y L2. Si una lista tiene longitud menor,
% entonces el resto de la lista más larga es pasado sin cambiar. Indicar la 
% reversibilidad, es decir si es posible obtener L3 a partir de L1 y L2, y viceversa.

% Ejemplo: intercalar([a,b], [c,d,e], [a,d,b,e,c]).
*/
intercalar([], L2, L2).
intercalar(L1, [], L1) :- L1 \= [].
intercalar([H1|T1], [H2|T2], [H1,H2|T3]) :- 
    intercalar(T1, T2, T3).

% L3 es reversible, ?L3.