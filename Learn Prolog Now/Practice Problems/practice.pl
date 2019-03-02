%is_prime(2).
%is_prime(3).
%is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ has_factor(P,3).

%has_factor(N,L) :- N mod L =:= 0.
%has_factor(N,L) :- L*L < N, L2 is L + 2, has_factor(N,L2).

sumofdigits(X, X) :- X<10.
sumofdigits(X, Y) :- X>=10, X1 is X // 10, X2 is X mod 10, sumofdigits(X1, Y1), Y is Y1 + X2.