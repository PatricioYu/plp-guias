padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

/*
* i. ¿Cuál el resultado de la consulta abuelo(X, manuel)?
*/
% X = juan ;
% false.

/*
* ii. A partir del predicado binario padre, definir en Prolog los predicados binarios:
* hijo, hermano y descendiente.
*/

% X es hijo de Y
hijo(X, Y) :- padre(Y, X).

% X es hermano de Y
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.

% X es descendiente de Y
descendiente(X, Y) :- padre(Y, X).
descendiente(X, Y) :- abuelo(Y, X).

/* 
*iv. ¿Qué consulta habría que hacer para encontrar a los nietos de juan?
*/
% ?- abuelo(juan, Y).
% Y = daniel ;
% Y = diego ;
% Y = pablo ;
% Y = manuel ;
% Y = ramiro.

/*
* v. ¿Cómo se puede definir una consulta para conocer a todos los hermanos de pablo?
*/
% ?- hermano(pablo, Y).     ?- hermano(X, pablo)
% Y = manuel ;              % X = manuel ;
% Y = ramiro.               % X = ramiro.

/* 
* vii. Explicar la respuesta a la consulta ancestro(juan, X).
* ¿Qué sucede si se pide más de un resultado?
*/ 

% ancestro(X, X).
% ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% lo que sucede es que agota los Z tales que X es padre de Z, y como Z puede ser 
% cualquier instancia, se cuelga, por eso basta con pedir primero que 
% X sea necesariamente padre de Z.

% pregunta, como hago para pedir que X no puede ser su propio ancestro.
ancestro(X, X).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).