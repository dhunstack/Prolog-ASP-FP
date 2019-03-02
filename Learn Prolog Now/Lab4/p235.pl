​p235(N, Ans) :- generate(N, [1], Ans).

generate(1, [H|_], H).
generate(N, [H|T], Ans) :- N > 0, N1 is N - 1, A1 is H * 2, A2 is H * 3, A3 is H * 5, merge(T, [A1, A2, A3], Merged),
							generate(N1, T, Ans).


merge(L1, [], L1).
merge(L1, [H | T], Ans) :- insert(H, L1, Result), merge(Result, T, Ans).

insert(A, [], [A]).
insert(A, [A| Rest], [A|Rest]).
insert(A, [B| Rest], [A, B |Rest]) :- A < B.
insert(A, [B| Rest], [B|B1]) :- A > B, insert(A, Rest, B1).  