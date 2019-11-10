%Exercise 1

s --> ublock(Count), vblock(CountTwo),{ Count is CountTwo * 2 }.

ublock(0) --> [2].
ublock(NewCount) --> [0], ublock(Count), {NewCount is Count+1}.
ublock(NewCount) --> [1], ublock(Count),  {NewCount is Count}.

vblock(0) --> [].
vblock(NewCount) --> [0], vblock(Count), {NewCount is Count}.
vblock(NewCount) --> [1], vblock(Count), {NewCount is Count+1}.

%Exercise 2

s --> col(X),nat(Q),pet(A),col(Y),nat(W),pet(S),col(Z),nat(E),pet(D),{X=\=Y,Y=\=Z,X=\=Z, Q=\=W,W=\=E,Q=\=E, A=\=S,S=\=D,D=\=A}.
col(1) --> [red].
col(2) --> [green].
col(3) --> [blue].

nat(1) --> [english].
nat(2) --> [spanish].
nat(3) --> [japanese].

pet(1) --> [jaguar].
pet(2) --> [snail].
pet(3) --> [zebra].

%Exercise 3
s(0) --> [].

s(A, B, D) :- mkList(A, C), sum(A, C, B, E),  D=E.

sum(Count,[H|_]) --> [H], {H is Count }.
sum(C, [A|_], [A|B], E) :- A<C, D is C-A, s(D, B, F), E=F.
sum(C, [_|A], B, E) :- sum(C, A, B, F), E=F.

mkList(0,[]). 
mkList(Num,List) :- NewNum is Num-1, NewNum >= 0, mkList(NewNum,L), append([Num],L,List). 

