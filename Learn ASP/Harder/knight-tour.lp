%% clingo -c n =8 thisfile.asp   will generate knight's tour for 8x8 board.
size(n).
number(1..n).
cell(X,Y)   :- number(X), number(Y).

% There is no tour for a NxN chessboard where N is odd.
even :- size(N), number(X), N = X+X.
:- not even.
% There is no tour for a NxN chessboard where N is lesser than 6.
:- size(N), N < 6.

% delta(1,2). delta(1,-2). delta(2,1). delta(2,-1).
delta(1,2; 1,-2; 2,1; 2,-1).
jump(X,Y,X+DX,Y+DY) :- cell(X,Y), delta(DX,DY), cell(X+DX,Y+DY).
jump(X,Y,X-DX,Y-DY) :- cell(X,Y), delta(DX,DY), cell(X-DX,Y-DY).
% Choose some moves from all valid jumps and ignore others.
move(X,Y,XX,YY) ; other(X,Y,XX,YY) :- jump(X,Y,XX,YY). 

% Knight must jump out of each cell
from(X,Y) :- move(X,Y,XX,YY).
:- cell(X,Y), not from(X,Y).

% Each cell must be reached by the knight from any square (say 1,1).
reached(X,Y) :- move(1,1,X,Y).
reached(X2,Y2) :- reached(X1,Y1), move(X1,Y1,X2,Y2).
:- cell(X,Y), not reached(X,Y).

#show move/4.
