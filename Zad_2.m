clc;
clear variables;

%parametry ukladu [wykorzystany nr albumu 150201]
m=0.023/(1+0+1);
g=9.81;
FemP1=1.7521*10^(-2);
FemP2=5.8231*10^(-3);
f1=1.41442*10^(-4);
f2=4.5626*10^(-3);
ki=2.5165;
ci=0.0243*sign(5-1);
d=0.066*(1+0.11);
bd=0.06;
xd=d-bd;
x10=0.008;
x20=0.00;
x30=0.75;
u10=(x30-ci)/ki;

%obliczenie brakujacych elementow macierzy A i B
a21=(1/(2*m))*x30^2*(FemP1/FemP2^2)*exp(-x10/FemP2);
a23=-(1/m)*x30*(FemP1/FemP2)*exp(-x10/FemP2);
a31=(1/f1)*exp(x10/f2)*(ki*u10+ci-x30);
a33=-(f2/f1)*exp(x10/f2);
b31=ki*(f2/f1)*exp(x10/f2);

%utworzenie macierzy A, B, C i D dla rownan stanu
A=[0 1 0; a21 0 a23; a31 0 a33];
B=[0 0; 0 g; b31 0];
C=[1 0 0];
D=[0 0];
rank(A);

%sprawdzenie sterowalności
S=ctrb(A,B);%utworzenie macierzy sterowalności
rank(S);
if rank(S)==rank(A)
    disp('Uklad sterowalny')
else
    disp('Uklad niesterowalny')
end

%sprawdzenie obserwowalności
O=obsv(A,C);%utworzenie macierzy obserwowalności
rank(O);
if rank(O)==rank(A)
    disp('Uklad obserwowalny')
else
    disp('Uklad nieobserwowalny')
end

%sprawdzenie stabilności
p=eig(A);%utworzenie wektora wartości własnych
if p(:)<0
    disp('Uklad stabilny')
else
    disp('Uklad niestabilny')
end