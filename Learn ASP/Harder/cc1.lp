%% Make change for 'amt' using 'n' coins of given denominations.

#const n = 10.  % number of coins to use
#const m = 60. % amount to make change for

% coin denomintatoins
coin(1;2;5;10).

val(0..n). % max value for any one partition

1{use(I,V):val(V)}1 :- coin(I).

% constrain that sum should be m  and num of coins must be n.

:- m != #sum{V*I,I:use(I,V)}.
:- n != #sum{V,I:use(I,V)}.

#show use/2.