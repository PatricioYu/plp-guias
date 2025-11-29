%! cuadradoSemiMagico(+N, -XS)
cuadradoSemiMagico(0, []).
cuadradoSemiMagico(N, XS) :-
    desde(0, M),
    matricesConFilasDeLongLQueSumanN(N, M, N, XS).

%! listaQueSuma(+L, +N, -Lista)
listaQueSuma(0, 0, []).
listaQueSuma(L, N, [H|T]) :-
    L > 0,
    between(0, N, H),
    M is N - H,
    LT is L - 1,
    listaQueSuma(LT, M, T).

%! matricesConFilasDeLongLQueSumanN(+L, +N, +FActual, -MT)
matricesConFilasDeLongLQueSumanN(_, _, 0, []).
matricesConFilasDeLongLQueSumanN(L, N, FActual, [H|T]) :-
    length([H|T], FActual),
    FActualT is FActual - 1,
    listaQueSuma(L, N, H),
    matricesConFilasDeLongLQueSumanN(L, N, FActualT, T). 

desde(N, N).
desde(X, N) :-
    Y is X + 1,
    desde(Y, N).