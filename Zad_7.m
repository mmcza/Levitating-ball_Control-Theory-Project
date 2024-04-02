clc;
clear variables;
%wczytanie macierzy A, B, C i D obliczonych w zadaniu 2
Zad_2;
a=poly(A);%wielomian charakterystyczny

%przeksztalcenie do postaci kanonicznej sterowalnej
Alpha=[0 1 0; 0 0 1; -a(4) -a(3) -a(2)];
Beta=[0; 0; 1];
Salpha=ctrb(Alpha,Beta);%macierz sterowalnosci nowego ukladu
B_1=B(:,1); %zamiana macierzy B na wektor
S_1=ctrb(A,B_1); %macierz sterowalnosci ukladu z nową macierzą B
P=Salpha*S_1^-1; %macierz przekształcenia

Alpha_spr=P*A*P^-1; %sprawdzenie poprawnosci wyznaczenia macierzy P
Beta_spr=P*B; %wyznaczenie macierzy wejsc ukladu
Gamma=C*P^-1; %wyznaczenie macierzy wyjsc nowego ukladu
Delta=D; %macierz przenoszenia nowego ukladu

%poniższe linijki służą sprawdzeniu czy po przekształceniu układ ma taką
%samą transmitancję
[num1,den1]=ss2tf(A,B,C,D,1);
[num2,den2]=ss2tf(A,B,C,D,2);

[num3,den3]=ss2tf(Alpha_spr,Beta_spr,Gamma,Delta,1);
[num4,den4]=ss2tf(Alpha_spr,Beta_spr,Gamma,Delta,2);

if num1-num3<1e-8 & num2-num4<1e-8 & den1-den3<1e-8 & den2-den4<1e-8
    disp('OK')
else
    disp('Inna transmitancja')
end

%przekształcenie do postaci diagonalnej
[M,Alpha_diag]=jordan(A); % M macierz modalna, Alpha_m diagonalna macierz stanu
Alpha_diag_spr=M^-1*A*M; %sprawdzenie czy poprawnie wyznaczona jest nowa macierz stanu
Beta_diag=M^-1*B; %wyznaczenie nowej macierzy wejsc
Gamma_diag=C*M; %wyznaczenie nowej macierzy wyjsc
Delta_diag=D; %macierz przenoszenia nowego ukladu

%poniższe linijki służą sprawdzeniu czy po przekształceniu układ ma taką
%samą transmitancję

[num5,den5]=ss2tf(Alpha_diag,Beta_diag,Gamma_diag,Delta_diag,1);
[num6,den6]=ss2tf(Alpha_diag,Beta_diag,Gamma_diag,Delta_diag,2);

if num1-num5<1e-8 & num2-num6<1e-8 & den1-den5<1e-8 & den2-den6<1e-8
    disp('OK')
else
    disp('Inna transmitancja')
end