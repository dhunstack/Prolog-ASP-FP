% Magic squares of size n

% input: positive integer n.

1 {num(R,C,1..n*n)} 1 :- R=1..n, C=1..n.
% achieved: every square of the grid is filled with
%           a number between 1 and n^2.

R1=R2 :- num(R1,_,X), num(R2,_,X).
C1=C2 :- num(_,C1,X), num(_,C2,X).
% achieved: different squares are filled with different
%           numbers.

% Magic constant: (1+2+...+n^2)/n.
#const magic=(n**3+n)/2.

:- #sum{X : num(R,_,X)} != magic, R=1..n.
% achieved: every row sums up to magic.

:- #sum{X : num(_,C,X)} != magic, C=1..n.
% achieved: every column sums up to magic.

:- #sum{X : num(R,R,X)} != magic.
:- #sum{X : num(R,n+1-R,X)} != magic.
% achieved: both diagonals sum up to magic.

