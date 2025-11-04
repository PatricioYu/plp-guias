/*
Definir los siguientes predicados sobre listas usando append:
* i. last(?L, ?U), donde U es el último elemento de la lista L.
*/
last([U|[]], U).
last([_|T], U) :- last(T, U).

/*
* ii. reverse(+L, ?R), donde R contiene los mismos elementos que L, pero en orden inverso.
* Ejemplo: reverse([a,b,c], [c,b,a]). Mostrar el árbol de búsqueda para el ejemplo dado.
*/
reverse([], []).
reverse([H|T], R) :- reverse(T, Rs), append(Rs, [H], R).

/*
* iii. prefijo(?P, +L), donde P es prefijo de la lista L.
*/
prefijo(P, L) :- append(P, _, L).

/*
* iv. sufijo(?S, +L), donde S es sufijo de la lista L.
*/
sufijo(S, L) :- append(_, S, L).

/*
* v. sublista(?S, +L), donde S es sublista de L.
*/
sublista([], _).
sublista(S, L) :- sufijo(Suf, L), prefijo(S, Suf), S \= [].

/*
* vi. pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L. 
* (Este predicado ya viene definido en Prolog y se llama member).
*/
pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).