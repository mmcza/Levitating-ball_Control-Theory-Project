clc;
clear variables;
%wczytanie macierzy A, B, C i D obliczonych w zadaniu 2 oraz wzmocnień
%sprzężenia od stanu z zadania 4
Zad_4

p_d=[-50 -40 -30]; %zadane wartosci wlasne sprzezenia od stanu
Kxpom=place(A,Bpom,p_d) %obliczenie wzmocnien sprzezenia od stanu

%Dyskretyzacja modelu
Tp=0.001;
Ad=eye(3)+A*Tp;
Bd=B*Tp;
Cd=C;
Dd=D;

