/*
* Definir el predicado juntar(?Lista1,?Lista2,?Lista3), que tiene éxito si Lista3 
* es la concatenación de Lista1 y Lista2.
*/

% juntar(?Lista1, ?Lista2, ?Lista3)
juntar([], Ys, Ys).
juntar([X|Xs], Ys, [X|Rs]) :- juntar(Xs, Ys, Rs).

/*
?- juntar([a,b,c], [d,e], [a,b,c,d,e]). 
→ true.
?- juntar([a,b,c], [d,e], L). 
→ L = [a,b,c,d,e];
→ false.
?- juntar([a,b,c], L, [a,b,c,d,e]). 
→ L = [d,e];
→ false.
?- juntar(L, [d,e], [a,b,c,d,e]). 
→ L = [a,b,c];
→ false.
?- juntar(L1, L2, [1,2,3]).
→ 
L1 = [], L2 = [1, 2, 3]; 
L1 = [1], L2 = [2, 3];
L1 = [1,2], L2 = [3]; 
L1 = [1,2,3], L2 = [];
false.
*/