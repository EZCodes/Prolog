numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).



add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

add2(0,0,0).
add2(0,s(X),s(Z)) :- add2(0,X,Z).
add2(0,p(X),p(Z)) :- add(0,X,Z).
add2(X+Y,Q+V,Z) :- add2(X,Y,S), add2(Q,V,W), add2(S,W,Z).
add2(X+Y,Q,Z) :- add2(X,Y,S), add2(S,Q,Z).
add2(X,Y+Q,Z) :- add2(Y,Q,S), add2(X,S,Z).


add2(p(s(X)),Y,Z) :- add2(X,Y,Z).
add2(s(p(X)),Y,Z) :- add2(X,Y,Z).
add2(p(X),Y,p(Z)) :- add2(X,Y,Z).
add2(s(X),Y,s(Z)) :- add2(X,Y,Z).

