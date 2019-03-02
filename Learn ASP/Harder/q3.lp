num(1..n).

1{queen(I,J) : num(I)}1 :- num(J).

%%% Horizontal
:- queen(I,J1), queen(I,J2), J1 != J2.

%%% Diagonal
:- queen(I1,J1), queen(I2,J2), I1 < I2, | I1-I2 |  = | J1-J2 |.

#show queen/2.
