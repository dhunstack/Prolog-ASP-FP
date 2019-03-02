initialize([],[]).
initialize([_|T1], [0|T2]) :- initialize(T1,T2).

cost(N, [], N, [], Tail, Tail).
cost(N, [H1|T1], Acc, [H2|T2], Tail, Ans) :- Acc < N, Acc1 is Acc + H1, H3 is H2 + 1, cost(N, [H1|T1], Acc1, [H3|T2], Tail, Ans).
cost(N, [_|T1], Acc, [H2|T2], Tail, Ans) :- Acc =< N, cost(N, T1, Acc, T2, [H2|Tail], Ans).

rev([], Acc, Acc).
rev([H1|T1], Acc, Ans) :- rev(T1, [H1|Acc], Ans).

cc(N, D, Ans) :- initialize(D, X), cost(N, D, 0, X, [], RevAns), rev(RevAns, [], Ans).