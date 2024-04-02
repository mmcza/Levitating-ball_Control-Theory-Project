clc;
clear variables;
%wczytanie macierzy A, B, C i D obliczonych w zadaniu 2 oraz wzmocnień
%sprzężenia od stanu z zadania 4
Zad_4

%obliczenie wzmocnień obserwatora
p_d=[-50 -40 -30]; %zadane wartosci wlasne sprzezenia od stanu
Kxpom=place(A,Bpom,p_d) %obliczenie wzmocnien sprzezenia od stanu
w_o=-100; %wartosci wlasne obserwatora
L=acker(A',C',[w_o,w_o,w_o]) %wzmocnienia obserwatora

%Czas probkowania dla dyskretnego obserwatora
Tp=0.0001; %nalezy zmienic rowniez wewnatrz modelu