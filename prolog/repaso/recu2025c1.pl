%! formula(+VS, -F)
formula(VS, F) :- desde(1, N), formulaDeNNodos(N, VS, F).

%! formulaDeNNodos(+N, +VS, -F)
formulaDeNNodos(1, VS, F) :- member(F, VS).
formulaDeNNodos(N, VS, neg(F)) :- 
    N > 1,
    Nm1 is N - 1,
    formulaDeNNodos(Nm1, VS, F).
formulaDeNNodos(N, VS, imp(F1, F2)) :- 
    N > 2,
    paresQueSuman(N1, N2, N),
    formulaDeNNodos(N1, VS, F1),
    formulaDeNNodos(N2, VS, F2).

%! paresQueSuman(-A, -B, +N)
paresQueSuman(A, B, N) :-
    between(1, N, A),
    B is N - A,
    B > 0.

%! desde(+X, ?Y)
desde(X, X).
desde(X, Y) :- nonvar(Y), X < Y.
desde(X, Y) :- var(Y), N is X + 1, desde(N, Y).

listaDeN(0, []).
listaDeN(N, L) :-
    N > 0,
    between(1, N, N2),
    N3 is N - N2,
    listaDeN(N3, L1),
    append([N2], L1, L).

capicua([]).
capicua([_]).
capicua(L) :-
    append([X], Xs, L),
    append(Ys, [X], Xs),
    capicua(Ys).