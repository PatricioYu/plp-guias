/*
% Definir el predicado aplanar(+Xs, -Ys), que es verdadero sii Ys contiene los elementos 
% de todos los niveles de Xs, en el mismo orden de aparición. Los elementos de Xs son
% enteros, átomos o nuevamente listas, de modo que Xs puede tener una profundidad
% arbitraria. Por el contrario, Ys es una lista de un solo nivel de profundidad.

% Ejemplos:
?- aplanar([a, [3, b, []], [2]], L).→ L=[a, 3, b, 2]
?- aplanar([[1, [2, 3], [a]], [[[]]]], L).→ L=[1, 2, 3, a]
*/

aplanar([], []).
aplanar([H|T], Ys) :- 
    aplanar(H, Hp),
    aplanar(T, Tp),
    append(Hp, Tp, Ys).
aplanar(X, [X]) :-
    X \= [],
    X \= [_|_].