% Choose exactly one target for each number
1 { target(X,Y,XX,YY) : area(XX,YY,A) } 1 :- number(X,Y,N).

% Movement must be in the same row or collumn 
:- target(X,Y,XX,YY), X != XX, Y != YY.

% Ensure target cell exists
:- target(X,Y,XX,YY), not cell(XX,YY).

% Each area must receive at least one number
:- area(_,_,A), not used(A).

used(A) :- target(X,Y,XX,YY), area(XX,YY,A).

% Horizontal path
path(X1,Y,X,Y) :-
    target(X,Y,X2,Y),
    X <= X2,
    X1 = X..X2.

path(X1,Y,X,Y) :-
    target(X,Y,X2,Y),
    X2 < X,
    X1 = X2..X.

% Vertical path
path(X,Y1,X,Y) :-
    target(X,Y,X,Y2),
    Y <= Y2,
    Y1 = Y..Y2.

path(X,Y1,X,Y) :-
    target(X,Y,X,Y2),
    Y2 < Y,
    Y1 = Y2..Y.

:- path(X,Y,SX,SY), path(X,Y,SX2,SY2),
   (SX,SY) != (SX2,SY2).

:- goal(A,G),
   G != #sum { N,X,Y :
        target(X,Y,XX,YY),
        area(XX,YY,A),
        number(X,Y,N)
   }.
   
#show target/4.