vacio(nil).

raiz(bin(_, R, _), R).

altura(nil, 0).
altura(bin(I, R, D), A) :-
    R \= nil,
    altura(I, AI),
    altura(D, AD),
    A is 1 + max(AI, AD).

cantNodos(nil, 0).
cantNodos(bin(I, R, D), CNodos) :-
    R \= nil,
    cantNodos(I, CNodosI),
    cantNodos(D, CNodosD),
    CNodos is 1 + CNodosI + CNodosD.