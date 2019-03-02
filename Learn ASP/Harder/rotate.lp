%%% Add some comments here with your roll. no., name and any other
%%% explanation you want to give.

#const maxL=10.  % no number will be than 10 digits.
#const n=12345. % can change n by command line
#const k=2. % can change k by command line.
len(1..maxL).
num(1..n). % n can be passed on the command line.

% define  rot(K, N, M) which means M is N rotated right by K positions
% where K is less than length N. Eg. rot(2, 12345, 45123).
% add your code here ....
%
ndigits(I,K) :- num(I), len(K), 10 ** (K - 1) <= I,  10 ** K > I.

splt(K,N,L,R) :- len(K), num(N), ndigits(N,K1), K1 > K, L = N / 10 ** K, R = N \ 10 ** K.

rot(K, N, N1) :- splt(K, N, L, R), ndigits(L, NL), N1 = (R * 10 ** NL) + L.

ans(X) :- rot(k,n,X).
#show ans/1.
