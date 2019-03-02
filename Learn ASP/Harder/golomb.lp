%
% Golomb ruler. https://en.wikipedia.org/wiki/Golomb_ruler
%
order(m). % number of marks to make is m.
pos(0..n). % length of ruler is n. n+1 markable positions 0..n

used(0).  % first mark is at 0.

{used(N)} :- pos(N). % mark some subset of positions.

:- not m = #count{N:used(N)}.  % use only models with exactly m marks.

% For each marked position P1, compute the distance with each successive 
% marked position P2.
d(P1,D) :- used(P1), used(P2), P1 < P2, D = P2 - P1.

% Discard models in which more than one pair of non-free position have the 
% same distance.
:- d(P1,D), d(P2,D), P1 < P2.


