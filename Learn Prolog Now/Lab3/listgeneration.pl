listelem([H|_], H).
listelem([_|T], Ans) :- listelem(T, Ans).