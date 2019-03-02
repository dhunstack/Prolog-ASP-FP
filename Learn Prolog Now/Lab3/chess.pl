kmove([X1, Y1], [X2, Y2]) :- X2 is X1 + 1, Y2 is Y1 + 2, X2 =< 8, Y2 =< 8. 
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 + 2, Y2 is Y1 + 1, X2 =< 8, Y2 =< 8.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 + 2, Y2 is Y1 - 1, X2 =< 8, Y2 > 0.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 + 1, Y2 is Y1 - 2, X2 =< 8, Y2 > 0.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 - 1, Y2 is Y1 - 2, X2 > 0, Y2 > 0.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 - 2, Y2 is Y1 - 1, X2 > 0, Y2 > 0.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 - 2, Y2 is Y1 + 1, X2 > 0, Y2 =< 8.
kmove([X1, Y1], [X2, Y2]) :- X2 is X1 - 1, Y2 is Y1 + 2, X2 > 0, Y2 =< 8.   