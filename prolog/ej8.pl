/*
% Definir el predicado parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista
% con elementos de L que suman S. Por ejemplo:

?- parteQueSuma([1,2,3,4,5],9,P).
P = [1, 3, 5] ;
P = [2, 3, 4] ;
P = [4, 5] ;
false.
*/
parteQueSuma([], 0, []).
parteQueSuma([H|T], S, [H|Tp]) :- 
    SMenosH is S - H,
    SMenosH >= 0,
    parteQueSuma(T, SMenosH, Tp).
parteQueSuma([_|T], S, P) :-
    parteQueSuma(T, S, P).