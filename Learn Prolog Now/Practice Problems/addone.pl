addone([],[]).
addone([H1|T1],[H2|T2]) :- H2 is H1 + 1, addone(T1,T2).