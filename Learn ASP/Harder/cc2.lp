%% Make change for amt 'm' using minimum total coins.
#const m = 100. % amount to make change for
% coin denomintations
coin(5;10;25;50;1;2).

val(0..m). % max value for any one partition

% for each value V, fix one value J for the number coins of den. I used.
1 {canUse(V,I,J): val(J), J*I <= V} 1 :- coin(I), val(V).

% ensure that if V is a value, then we should be able to make change for it

V #sum{I*J,I:canUse(V,I,J): coin(I),val(J)} V :- val(V).  % every value V is ok.

% find what is the maximum number J of coins of den. I used for any value K.
max(I,J) :- coin(I), val(J), J = #max{ K: val(K), canUse(V,I,K)}.

#minimize{V,I:max(I,V)}.
% #show canUse/3.
#show max/2.
