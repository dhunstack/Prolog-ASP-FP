sSet(X, Y, Ans) :- multset(X, Y, 0, [], RevAns), rev(RevAns, [], Ans).

rev([], Acc, Acc).
rev([H1|T1], Acc, Ans) :- rev(T1, [H1|Acc], Ans).

multset([], N, N, Set, Set).
multset([H|T], N, Acc, Set, Ans) :- Acc1 is Acc + H, multset(T, N, Acc1, [H|Set], Ans).
multset([_|T], N, Acc, Set, Ans) :- multset(T, N, Acc, Set, Ans).