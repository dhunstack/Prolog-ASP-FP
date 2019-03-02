%
% Code from https://thelazydev.net/blog/post/the-basics-of-answer-set-programming
%
#const b = 3. % Blocksize
#const n = 9. % Max-Value

value(1..n).
sudoku(X,Y,V) :- initial(X,Y,V).

% Show what pairs of coordinates lie in the same block
sameBlock(X,Y,XX,YY) :- value(X), value(XX), value(Y), value(YY), 
						(X-1)/b == (XX-1)/b, (Y-1)/b == (YY-1)/b.

% For every value X and Y that don't describe a cell that is initially filled out, 
% choose one value V and generate fact sudoku(X,Y,V)
1 { sudoku(X,Y,V) : value(V) } 1 :- value(X), value(Y), not initial(X,Y,_).

% Each row may only contain the same value once
:- sudoku(X,Y,V), sudoku(XX,Y,V), X != XX.
% Each column may only contain the same value once
:- sudoku(X,Y,V), sudoku(X,YY,V), Y != YY.

% Each block may only contain the same value once
:- sudoku(X,Y,V), sudoku(XX,YY,V), sameBlock(X,Y,XX,YY), X != XX, Y != YY.

#show sudoku/3.
