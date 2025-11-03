natural(0).
natural(suc(X)) :- natural(X).

menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).

/* 
* i. Explicar qué sucede al realizar la consulta menorOIgual(0,X). 
*/

% se cuelga porque tiene que probar todos los posibles suc(Y), y éstos son infinitos,
% pero además no sabe por qué Y arrancar, si invertimos el orden, va a dar primero
% Y = 0, y luego va a dar todos los Y = succ(succ(...suc(0))) infinitamente, pero
% no se "cuelga", porque tenía de dónde arrancar por así decirlo.

/* 
* ii. Describir las circunstancias en las que puede colgarse un programa en Prolog.
* Es decir, ejecutarse infinítamente sin arrojar soluciones. 
*/

% si la recursión no tiene caso base.
% si el caso base es inalcanzable.
% Si en una llamada recursiva Prolog no tiene suficientes restricciones (por ejemplo,
% una variable libre en una aritmética o comparación), la búsqueda puede quedar atrapada.
% si en una gramática o una definición lógica una regla se refiere a sí misma antes de
% consumir algo de la entrada, puede generar un bucle infinito.

/*
* iii. Corregir la definición de menorOIgual para que funcione adecuadamente. 
*/

% hay que invertir el orden en que se hacen las distintas valuaciones de los casos.