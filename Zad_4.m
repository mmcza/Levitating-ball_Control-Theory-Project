clc;
clear variables;
%wczytanie macierzy A, B, C i D obliczonych w zadaniu 2
Zad_2
%ze wzgledu na to, ze mozemy wplywac jedynie na 1 sygnal wejsciowy
%nastapila zmiana macierzy B
Bpom=B(:,1);
%obliczenie wzmocnien sprzezenia od stanu
p_d=[-50 -40 -30]; %zadane wartosci wlasne 1
%p_d=[-80 -20+51j -20-51j]; %zadane wartosci wlasne 2
%p_d=[-20+20j -15 -20-20j]; %zadane wartosci wlasne 3
Kxpom=place(A,Bpom,p_d) %obliczenie wzmocnien sprzezenia od stanu
A1pom=A-Bpom*Kxpom %wyznaczenie macierzy stanu ukladu zamknietego
eig(A1pom) %sprawdzenie czy wartosci wlasne sa takie jak zadane



%obliczenie wzmocnień do sprzężenia wyprzedzającego
Kyr=(a21*a33-a31*a23)/(a23*b31);
Kdyr=-(a21)/(a23*b31);
Kddyr=-(a33)/(a23*b31);
Kdddyr=1/(b31*a23);
Kg=a33/(a23*b31);

K1=1;
K2=1;
K3ddyr=1/a23;
K3yr=-a21/a23;
K3g=-1/a23;

%obliczenie macierzy stanu układu zamkniętego
Kx=-place(A,B,p_d);
A1=A+B*Kx;
eig(A1)