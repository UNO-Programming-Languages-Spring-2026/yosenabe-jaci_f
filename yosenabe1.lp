% Choose exactly one target for each number
1 { target(X,Y,XX,YY) : area(XX,YY,A) } 1 :- number(X,Y,N).

% Movement must be straight (same row or same column)
:- target(X,Y,XX,YY), X != XX, Y != YY.

% Ensure target cell exists
:- target(X,Y,XX,YY), not cell(XX,YY).

#show target/4.
