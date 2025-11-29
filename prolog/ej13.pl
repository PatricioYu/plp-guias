%! coprimos(-X, -Y)
coprimos(X, Y) :-
    desde(1, N),
    paresQueSuman(X, Y, N),
    X > 1,
    Y > 1,
    gcd(X, Y) =:= 1.

%! paresQueSuman(?X, ?Y, +N)
paresQueSuman(X, Y, N) :-
    between(1, N, X),
    Y is N - X.

desde(N, N).
desde(X, N) :-
    Y is X + 1,
    desde(Y, N).