desde(X,X).
desde(X,Y) :- 
    N is X+1, 
    desde(N,Y).

/* 
% i. ¿Cómo deben instanciarse los parámetros para que el predicado funcione? 
% (Es decir, para que no se cuelgue ni produzca un error) ¿Por qué?
*/

% desde(+X, -Y), la X debe estar instanciada a un entero, y la Y no debe estar instanciada

/*
% ii. Dar una nueva versión del predicado que funcione con la instanciación 
% desdeReversible(+X,?Y), tal que si Y está instanciada, sea verdadero si Y es mayor
% o igual que X, y si no lo está genere todos los Y de X en adelante.
*/

desdeReversible(X, X).
desdeReversible(X, Y) :-
    nonvar(Y) -> 
        X < Y;
        N is X + 1,
        desdeReversible(N, Y).