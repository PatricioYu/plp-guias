%! vacio(?B)
vacio(nil).

%! raiz(?B, ?R)
raiz(bin(_, R, _), R).

%! altura(+B, ?A)
altura(nil, 0).
altura(bin(I, R, D), A) :-
    R \= nil,
    altura(I, AI),
    altura(D, AD),
    A is 1 + max(AI, AD).

%! cantNodos(+B, ?CNodos)
cantNodos(nil, 0).
cantNodos(bin(I, R, D), CNodos) :-
    R \= nil,
    cantNodos(I, CNodosI),
    cantNodos(D, CNodosD),
    CNodos is 1 + CNodosI + CNodosD.

/*
% Definir los siguientes predicados, utilizando la representación de árbol binario 
% definida en el ejercicio 11:

% I. inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de
% sus nodos según el recorrido inorder.

% II. arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.

% III. aBB(+T), que será verdadero si T es un árbol binario de búsqueda.

% IV. aBBInsertar(+X, +T1, -T2), donde T2 resulta de insertar X en orden en el árbol T1. 
% Este predicado ¿es reversible en alguno de sus parámetros? Justificar.
*/

%! inorder(+AB, -Lista)
inorder(nil, []).
inorder(bin(I, R, D), Lista) :-
    R \= nil,
    inorder(I, ListaI),
    inorder(D, ListaD),
    append(ListaI, [R|ListaD], Lista).

%! arbolConInorder(+Lista, -AB)
arbolConInorder([], nil).
arbolConInorder(Lista, AB) :-
    append(ListaI, [R|ListaD], Lista),
    arbolConInorder(ListaI, AI),
    arbolConInorder(ListaD, AD),
    AB = bin(AI, R, AD).

%! aBB(+T)
aBB(nil).
aBB(B) :- 
    inorder(B, L),
    msort(L, L).

%! aBBInsertar(+X, +T1, -T2)
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(I, R, D), bin(TI, R, D)) :-
    aBB(bin(I, R, D)),
    X =< R,
    aBBInsertar(X, I, TI).
aBBInsertar(X, bin(I, R, D), bin(I, R, TD)) :-
    aBB(bin(I, R, D)),
    X > R,
    aBBInsertar(X, D, TD).