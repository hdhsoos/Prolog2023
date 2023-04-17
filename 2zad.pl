s1(X, Y1):- sin(X, Y), Y1 is Y.

pow2(X,Y,Z) :- Z is X**Y.

factorial(0,1):-!.
factorial(N,M) :-
N>0,
N1 is N-1,
factorial(N1, M1),
M is N*M1.

s2(X, Y1) :- X1 is float(X), loop(X1, 1, X, Y), Y1 is Y.

loop(X, N, Z, Y) :- N<50, 
factorial(((2*N)+1), M),
pow2(-1, N, Z1),
pow2(X, ((2*N)+1), Z2),
Y is (Z + ((Z1 * Z2)/(M))), 
loop(X, N+1, Y, Y1).

loop(X, N, Z, Y) :- N>=50, 
Y is Z.

abserr(X):- s2(X, B), s1(X, A), Z = abs(A - B), write("standart sin = "), format('~8f', A), writeln(""), write("approx sin = "), format('~8f', B), writeln(""), write("absolute error = "), format('~8f', Z).