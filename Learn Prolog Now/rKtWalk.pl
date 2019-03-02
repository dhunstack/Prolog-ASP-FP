/* knight's walk on a chess board of size N X N */
% random walk by knight. without repeating. - Siva.

rwalk_ntimes(Ctr,N,Start) :- between(1,Ctr,N1), rWalk(N, Start, Ans, N1).

rWalk(N,Start,Ans,Ctr) :- rWalk1(rand, N, [Start],Ans),  % Board size is N x N.
                      length(Ans, L), writef('In attempt %w Made %w moves ->  %w',[Ctr, L, Ans]).
rWalk1(HowNext, N,[Current|Rest],Ans) :- findall(Next, ktmove(N,Current,Next), Cands),
                                newMoves([Current|Rest],Cands,Poss), 
                                pickMove(HowNext, N, Poss, Step) ->
                                    rWalk1(HowNext, N, [Step|[Current|Rest]],Ans);  % contine walking
					 Ans = [Current|Rest]. % No more moves possible. stop

%  pick next move using different strategies. only 'rand' is implemented below.
pickMove(rand, N, [F | Poss],Step) :-
                length(Poss,M), % m is the number of possible steps from Current.
                (M =:= 0 -> Step = F;   % Exactly one move possible. Take it.
                  M1 is M + 1, random(1,M1,M2), nth1(M2,Poss,Step)). % Choose any one move randomly.

% newMoves(Visited,Candidates,Ans) is 
% Ans is moves in Candidates that are not  already in Visited.  
newMoves(Visited, [], []).
newMoves(Visited, [A|R], Ans) :- member(A,Visited) -> 
                                    newMoves(Visited,R,Ans); 
                                    newMoves(Visited, R, A1), Ans = [A|A1].


ktmove(N, [X,Y], [X1,Y1]) :- c1(N,X,X1), c2(N,Y,Y1).
ktmove(N,[X,Y], [X1,Y1]) :- c2(N,X,X1), c1(N,Y,Y1).

c1(N,X,X1) :- X > 1, X1 is X - 1.
c1(N,X,X1) :- X < N, X1 is X + 1.
c2(N,X,X1) :- X > 2, X1 is X - 2.
c2(N,X,X1) :- N1 is N - 1, X < N1, X1 is X + 2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hWalk(N,Start,Ans) :- rWalk1(haus, N, [Start],Ans).  % Hausdorff for next move
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

