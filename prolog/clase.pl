iesimo(1, [H|_], H).
iesimo(I, [_|T], X) :- I > 0, N is I - 1, iesimo(N, T, X).

iesimo2(I, L, X) :- 
    length(L, N), between(1, N, I), iesimo(I, L, X).
    
desde(X, X).
desde(X, Y) :-
    nonvar(Y) -> 
        X < Y;
        N is X + 1,
        desde(N, Y).

coprimos(1, _).
coprimos(_, 1).
coprimos(X, Y) :-
    desde(1, X),
    between(1, X, Y),
    between(2, X, Yn),
    (X mod Yn =:= 0 -> Y mod Yn > 0).