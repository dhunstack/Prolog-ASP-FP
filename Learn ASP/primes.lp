% Prime numbers from 1 to n

% input: positive integer n.

composite(N) :- N=1..n, I=2..N-1, N\I=0.
% achieved: composite(N) iff N is a composite number
%           from {1,...,n}.

prime(N) :- N = 2..n, not composite(N).

#show prime/1.
