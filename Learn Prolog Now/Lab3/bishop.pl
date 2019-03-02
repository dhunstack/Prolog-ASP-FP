listelem([H|_], H).
listelem([_|T], Ans) :- listelem(T, Ans).

bishop([X1,Y1],[X2,Y2]) :- listelem([1,2,3,4,5,6,7],Step), generateNext([X1, Y1], [X2, Y2], Step).
generateNext([X1, Y1], [X2, Y2], Step) :- X2 is X1 + Step, Y2 is Y1 + Step, X2 =< 8, Y2 =< 8.
generateNext([X1, Y1], [X2, Y2], Step) :- X2 is X1 + Step, Y2 is Y1 - Step, X2 =< 8, Y2 > 0.
generateNext([X1, Y1], [X2, Y2], Step) :- X2 is X1 - Step, Y2 is Y1 - Step, X2 > 0, Y2 > 0.
generateNext([X1, Y1], [X2, Y2], Step) :- X2 is X1 - Step, Y2 is Y1 + Step, X2 > 0, Y2 =< 8.