% ������� �������� ����������� ��������� (������) "��������"
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
% ������� �������� ����������� ��������� "�������"
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
% ������� �������� ������������ ��������� (������) "�������"
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
% ������� �������� ������������ ��������� (������) "�������"
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
% ������� �������� ������������ ��������� (������) "�������"
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
% ������� �������� ������������ ��������� (������) "�����"
cat(frosya).
cat(vikus).
cat(jersy).
%������� �������� ��������� (�������) "����"
mother(X,Y) :- parent(X, Y),female(X).
%������� �������� ��������� (�������) "����"
father(X,Y) :- parent(X, Y),male(X).
%������� �������� ��������� (�������) "������"
sister(X,Y) :- parent(Z, X), parent(Z,Y), female(X).
%������� �������� ��������� (�������) "����"
brother(X,Y) :- parent(Z, X), parent(Z,Y), male(X).
%������� �������� ��������� (�������) "�������"
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
%������� �������� ��������� (�������) "���������� ���� ��� ������"
cousins(X, Y):- parent(Z, Y), parent(W, X), (sister(W, Z);brother(W, Z)), not(W = Z).

%allcats: "��� ����� �����?"
allcats :- (writeln("There are cats:"); cat(Y),writeln(Y)),fail.

%mariasisters: "���� �� � ���� ������?"
mariasisters :- sister(maria, _), not(_ = maria); cousins(maria, _), female(_), not(_ = maria).

%semensisters: "���� �� � ���� ������?"
semensisters :- (sister(semen, _); cousins(semen, _)), female(_), writeln("� ����� ���� ������.").