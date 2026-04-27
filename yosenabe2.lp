% Choose exactly one target for each number
1 { target(X,Y,XX,YY) : area(XX,YY,A) } 1 :- number(X,Y,N).

% Movement must be in the same row or collumn 
:- target(X,Y,XX,YY), X != XX, Y != YY.

% Ensure target cell exists
:- target(X,Y,XX,YY), not cell(XX,YY).

% Each area must receive at least one number
:- area(_,_,A), not used(A).

used(A) :- target(X,Y,XX,YY), area(XX,YY,A).

#show target/4.