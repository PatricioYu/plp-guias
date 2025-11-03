vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).

/*
* i. Mostrar el árbol de búsqueda en Prolog para resolver vecino(5, Y, [5,6,5,3]), 
* devolviendo todos los valores de Y que hacen que la meta se deduzca lógicamente 
* del programa. 
*/

% vecino(5, Y, [5,6,5,3])
% |
% |--->vecino(5, Y, [5|[6|5,3]]). 
%      Y = 6;
% |--->vecino(5, Y, [5|[6,5,3]]), Y \= 6. 
%            vecino(5, Y, [6|[5,3]]).
%            |---> vecino(5, Y, [X|[Y|Ls]]). false.
%            |---> vecino(5, Y, [5|[3|[]]]). 
%                  |---> vecino(5, Y, [X|[Y|Ls]]). Y = 3.
%                  |---> vecino(5, Y, [3|[]]), Y \= 3.
%                        |---> vecino(5, Y, []).
%                              |---> vecino(5, Y, [X|[Y|Ls]]). false.

/* 
* ii. Si se invierte el orden de las reglas ¿Los resultados son los mismos?
* ¿Y el orden de los resultados? 
*/

% los resultados son los mismos, pero se invierte el orden también.