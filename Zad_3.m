clc;
clear variables;
%wczytanie macierzy A, B, C i D obliczonych w zadaniu 2
Zad_2

%wyznaczenie transmitancji obiektu
[num,den]=ss2tf(A,B,C,D,1);
G=tf(num,den)
[num1,den1]=ss2tf(A,B,C,D,2);
Gg=tf(num1,den1)