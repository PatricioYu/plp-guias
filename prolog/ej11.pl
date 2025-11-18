vacio(nil).

bin(nil, V, nil) :- V \= nil.
bin(bin(II, I, DI), V, nil) :- V \= nil, bin(II, I, DI).
bin(nil, V, bin(ID, D, DD)) :- V \= nil, bin(ID, D, DD).
bin(bin(II, I, DI), V, bin(ID, D, DD)) :- V \= nil, bin(II, I, DI), bin(ID, D, DD).

raiz(bin(I, X, D), X) :- bin(I, X, D).