nthp235(N,Ans) :- gener(N,[1],Ans).
gener(1,[A | Rest],A).
gener(X,[A | Rest],Ans) :- X > 0, X1 is X - 1, 
                           A1 is 2 * A, A2 is 3 * A, A3 is 5 * A,
                           merge(Rest,[A1,A2,A3],New),gener(X1,New,Ans).


merge(X,[],X).
merge(X,[A|Rest],Ans) :- ins(A,X,X1),merge(X1,Rest,Ans).

ins(A,[],[A]).
ins(A,[A|Rest],[A|Rest]).
ins(A,[B|Rest],[A,B|Rest]) :- A < B.
ins(A,[B|Rest],[B|R1]) :- A > B, ins(A,Rest,R1).
