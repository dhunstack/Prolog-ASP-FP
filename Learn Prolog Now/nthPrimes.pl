%%%%%%%%%%%%%%%%%%%%%%%%%% Generating nth number with only Primes as factors %%%

%%%%% first  some very basic code, but bad as it
genp235(N) :- counter(N), test_p235(N).
counter(1).
counter(N) :- counter(N1), N is N1 + 1.
/*  base case is 1. 
    otherwise if divisible by 2 (similarly 3,5)
    check the quotientient */

test_p235(1).
test_p235(N) :- Rem is N mod 2, Rem == 0, !,
                N1 is N // 2, test_p235(N1).
test_p235(N) :- Rem is N mod 3, Rem == 0, !,
                N1 is N // 3, test_p235(N1).
test_p235(N) :- Rem is N mod 5, Rem == 0,
                N1 is N // 5, test_p235(N1).
%%%%%%%%%%%%%/* to generate nth number */ in  a better than brute force way%%%%%

nthp235(N,Ans) :- gener(N,[1],Ans).
gener(1,[A | Rest],A).
gener(X,[A | Rest],Ans) :- X > 0, X1 is X - 1, 
                           A1 is 2 * A, A2 is 3 * A, A3 is 5 * A,
                           merge(Rest,[A1,A2,A3],New),gener(X1,New,Ans).


merge(X,[],X).
merge(X,[A|Rest],Ans) :- ins(A,X,X1),merge(X1,Rest,Ans).

ins(A,[],[A]).
ins(A,[A|Rest],[A|Rest]).
ins(A,[B|Rest],[A,B|Rest]) :- A < B.
ins(A,[B|Rest],[B|R1]) :- A > B, ins(A,Rest,R1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  mixes data with code. works only for 2, 3, 5.
% better way to test for any list of Primes.
test_pfacs(1,_). % 1 is base case.
test_pfacs(N,[P|R]) :- N > 1, Rem is N mod P, % check with first prime
		       (Rem == 0 -> (N1 is N // P, test_pfacs(N1, [P | R]));
		        test_pfacs(N, R)).

naiveNth(N, Primes, Ans) :- gen_next(N, 1, Primes, Ans).
gen_next(1, Cur, Primes, Cur).
gen_next(N, Cur, Primes, Ans) :- N > 1, Cnext is Cur + 1,
				(test_pfacs(Cnext, Primes) -> (N1 is N - 1, gen_next(N1, Cnext, Primes, Ans));
				      gen_next(N, Cnext, Primes, Ans)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% p235 problem solved more analtyically

% dlog- Ans is highest power of P <= N.
dlog(N,P,Ans) :- dlog1(N,P,P,0,Ans).
dlog1(N,P,C,I,I) :- C > N.
dlog1(N,P,C,I,Ans) :- C =< N, I1 is I + 1,
        C1 is C * P, dlog1(N,P,C1,I1,Ans).

% howMany(N, Primes, Ans).   Primes is list of prime factors.
% how many numbers <= N have only Primes as factors.
howMany(N, [], 0). % Base case - exhausted all the primes.
howMany(N,[P|R],Ans) :- dlog(N,P,A1), % A1 is highest power possible for P
			iterN(N,P,R,A2), Ans is A1 + A2.

iterN(0,P,_,0).
iterN(N,P,R,Ans) :- N > 0, howMany(N,R,A1), % A1 numbers not using P
		    N1 is N // P, % use P at least once
		    iterN(N1,P,R,A2),
		    Ans is A1 + A2.

% to find N-th biggest numbers with only Primes as factors.
%  first find upper bound by trying 10^N for N=1,2,.. & then binary search.
nthNumber(N, Primes, Ans) :- upperBound(Primes, N, Bound),
			     howMany(Bound, Primes, N1),
                             (N1 == N -> Ans = Bound;
			      (Low is Bound // 10,
               		     findExact(N, Primes, Low, Bound, Ans))).

upperBound(Primes, N, Ans) :- howMany(10, Primes, Nc), iterUpper(10, Primes, Nc, N, Ans).

iterUpper(Cur, Primes, Nc, N, Cur) :- Nc >= N.  % we have found a bound.
iterUpper(Cur, Primes, Nc, N, Ans) :- Nc < N, Cur1 is Cur * 10, howMany(Cur1, Primes, Nc1),
				      iterUpper(Cur1, Primes, Nc1, N, Ans).

findExact(N, Primes, Low, High, Ans):- Low < High, Try is (Low + High) // 2, Try > Low,
				       howMany(Try, Primes, N1),
				       (N1 == N -> Ans = Try;
          				       (N1 < N -> findExact(N, Primes, Try, High, Ans);
	               				findExact(N, Primes, Low, Try, Ans))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
