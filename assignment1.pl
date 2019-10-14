numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

add2(0,0,0).
add2(0,s(p(X)),Z) :- add2(0,X,Z).
add2(0,p(s(X)),Z) :- add2(0,X,Z).
add2(0,s(X),s(Z)) :- add2(0,X,Z).
add2(0,p(X),p(Z)) :- add2(0,X,Z).
add2(X+Y,Q+V,Z) :- add2(X,Y,S), add2(Q,V,W), add2(S,W,Z).
add2(X+Y,Q,Z) :- add2(X,Y,S), add2(S,Q,Z).
add2(X,Y+Q,Z) :- add2(Y,Q,S), add2(X,S,Z).
add2((-X),(-Y),Z) :- minus(X,S), minus(Y,Q), add2(S,Q,Z).
add2((-X),Y,Z) :- minus(X,S), add2(S,Y,Z).
add2(X,(-Y),Z) :- minus(Y,S), add2(X,S,Z).

add2(X-Y,Q-V,Z) :- subtract(X,Y,S), subtract(Q,V,W), add2(S,W,Z).
add2(X-Y,Q,Z) :- subtract(X,Y,S), add2(S,Q,Z).
add2(X,Y-Q,Z) :- subtract(Y,Q,S), add2(X,S,Z).

add2(p(0),Y,Z) :- add2(0,p(Y),Z).
add2(s(0),Y,Z) :- add2(0,s(Y),Z).
add2(p(s(X)),Y,Z) :- add2(X,Y,Z).
add2(s(p(X)),Y,Z) :- add2(X,Y,Z).
add2(p(X),Y,p(Z)) :- add2(X,Y,Z).
add2(s(X),Y,s(Z)) :- add2(X,Y,Z).

minus(0,0).
minus(p(s(X)),Z) :- minus(X,Z).
minus(s(p(X)),Z) :- minus(X,Z).
minus(p(X),s(Z)) :- minus(X,Z).
minus(s(X),p(Z)) :- minus(X,Z).
minus(X-Y,Z) :- subtract(X,Y,S), minus(S,Z).
minus(X+Y,Z) :- add2(X,Y,S), minus(S,Z).
minus((-X),Z) :- minus(X,S), minus(S,Z).

subtract(X,Y,Z) :- minus(Y,S), add2(X,S,Z).
subtract(X,(-Y),Z) :- add2(X,Y,Z).

subtract(X-Y,Q-V,Z) :- subtract(X,Y,S), subtract(Q,V,W), subtract(S,W,Z).
subtract(X-Y,Q,Z) :- subtract(X,Y,S), subtract(S,Q,Z).
subtract(X,Y-Q,Z) :- subtract(Y,Q,S), subtract(X,S,Z).
subtract(X+Y,Q+V,Z) :- add2(X,Y,S), add2(Q,V,W), subtract(S,W,Z).
subtract(X+Y,Q,Z) :- add2(X,Y,S), subtract(S,Q,Z).
subtract(X,Y+Q,Z) :- add2(Y,Q,S), subtract(X,S,Z).




