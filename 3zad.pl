% задание простого двуместного предиката (фактов) "родитель"
parent(olga,maria).
parent(mikhail, maria).
parent(olga,semen).
parent(mikhail, semen).
parent(frosya, vikus).
parent(frosya, jersy).
parent(avgustina, olga).
parent(valerii, olga).
parent(avgustina, julia).
parent(valerii, julia).
parent(julia, alexander).
parent(julia, andrew).
parent(valentina, mikhail).
parent(gennadii, mikhail).
parent(valentina, vladimir).
parent(gennadii, vladimir).
parent(vladimir, nikita).
parent(vladimir, gleb).
parent(vladimir, egor).
parent(alexander, alisa).
parent(andrew, anita).
parent(andrew, esenia).
% задание простого двуместного предиката "возраст"
age(maria, 19).
age(mikhail, 50).
age(olga, 46).
age(semen, 17).
age(frosya, 15).
age(vikus, 8).
age(jersy, 8).
age(avgustina, 78).
age(valerii, 80).
age(julia, 55).
age(valentina, 70).
age(gennadii, 62).
age(vladimir, 53).
age(nikita, 28).
age(gleb, 8).
age(egor, 10).
age(anita, 5).
age(alisa, 7).
age(esenia, 5).
age(andrew, 33).
age(alexandr, 31).
% задание простого одноместного предиката (фактов) "мужчина"
male(semen).
male(mikhail).
male(valerii).
male(alexander).
male(andrew).
male(gennadii).
male(vladimir).
male(nikita).
male(egor).
male(gleb).
% задание простого одноместного предиката (фактов) "женщина"
female(maria).
female(olga).
female(frosya).
female(vikus).
female(jersy).
female(avgustina).
female(julia).
female(anita).
female(esenia).
female(alisa).
% задание простого одноместного предиката (фактов) "человек"
human(maria).
human(olga).
human(mikhail).
human(semen).
human(avgustina).
human(julia).
human(valerii).
human(alexander).
human(andrew).
human(gennadii).
human(vladimir).
human(nikita).
human(egor).
human(gleb).
human(anita).
human(esenia).
human(alisa).
% задание простого одноместного предиката (фактов) "кошка"
cat(frosya).
cat(vikus).
cat(jersy).
%задание сложного предиката (правила) "мать"
mother(X,Y) :- parent(X, Y),female(X).
%задание сложного предиката (правила) "отец"
father(X,Y) :- parent(X, Y),male(X).
%задание сложного предиката (правила) "сестра"
sister(X,Y) :- parent(Z, X), parent(Z,Y), female(X).
%задание сложного предиката (правила) "брат"
brother(X,Y) :- parent(Z, X), parent(Z,Y), male(X).
%задание сложного предиката (правила) "бабушка"
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
%задание сложного предиката (правила) "двоюродный брат или сестра"
cousins(X, Y):- parent(Z, Y), parent(W, X), (sister(W, Z);brother(W, Z)), not(W = Z).

%allcats: "Как зовут кошек?"
allcats :- (writeln("There are cats:"); cat(Y), age(Y, A), write(Y), write(" "), writeln(A)),fail.

%allwomen: "Какие есть женщины в семье?"
allwomen :- (writeln("There are women:"); female(Y), age(Y, A),write(Y), write(" "), writeln(A)),fail.

%allmen: "Какие есть женщины в семье?"
allmen :- (writeln("There are men:"); male(Y), age(Y, A),write(Y), write(" "), writeln(A)), fail.

motherandchild(X) :- (writeln("These are all the children of this woman (if empty, then she has no children):"); mother(X, Y), writeln(Y)), fail.

%semensisters: "Есть ли у Сэма сестры?"
semensisters :- (sister(semen, _); cousins(semen, _)), female(_); writeln("Semen has a sister.").


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

abserr(X, B, A, Z):- s2(X, B), s1(X, A), Z = abs(A - B).	


start:-
	repeat,
	menu,
	readln(Ans),
	check(Ans).
	
menu:-
	writeln("Choose a command - enter:"),
	writeln("fam_tree - view family tree information;"),
	writeln("sin - calculate the sine by two methods and calculate the absolute error;"),
	writeln("exit - terminate.").
	

check([fam_tree]):-
	writeln("Choose a command - enter:"),
	writeln("start - back to menu"),
	writeln("womennames - show women names"),
	writeln("mennames - show men names"),
	writeln("catnames - show cat names"),
	writeln("semensis - find out if semen has a sister"),
	writeln("mother - show all children of a woman"),
	writeln("exit - terminate."),
	readln(Ans),
	check(Ans).

check([catnames]):-
	allcats,
	fail.

check([womennames]):-
	allwomen,
	fail.

check([mennames]):-
	allmen,
	fail.
	
	
check([semensis]):-
	semensisters,
	fail.

check([mother]):-
	write("Enter woman name:"),
	readln(IL),
	[I|_] = IL,
	motherandchild(I),
	fail.
	
check([sin]):-
	write("Enter number for caculate the sine: "),
	readln(IL),
	[I|_] = IL,
	abserr(I, B, A, Z),
	write("standart sin = "), format('~8f', A), writeln(""), write("approx sin = "), format('~8f', B), writeln(""), write("absolute error = "), format('~8f', Z).	
	fail.
	
check([exit]):-
	writeln("Program execution terminated.").