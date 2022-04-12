% F5 på BV2, 2020
%
% Skiven av: Ken Mattsson
%
% Lösa y_tt=gamma*y med CD2
% Sätt begynnelsedata till y=f, y_t=0. 
%
% Detta är ett Hamiltonskt system då gamma<0 (imaginära egenvärden)
% som ges av +- sqrt(gamma). Detta betyder att systemets energi
% E=y_t^2-gamma*y^2 är konstant (energi-konservativt). 
%
% Notera att CD2 (och CD4) är symplektiska, dvs de bevarar energin 
% dvs tillväxtfaktorerna |q_1,2|=1. För att testa detta behöver vi 
% uppskatta y_t numeriskt (denna term räknas aldrig ut med CD2)

 

close all;

gamma=-100;

k=0.001 ;          % Tidssteg
f=1;               % Begynnelsedata
T=10;              % Sluttid
N=floor(T/k);      % Antal steg

y=zeros(1,N+1);
t=0:k:T;

y(1)=f; % Sätt begynnelsedata
y(2)=(1+k^2/2*gamma)*f;

% CD2 algoritmen
for n=2:N
    y(n+1)=-y(n-1)+2*(1+gamma*k^2/2)*y(n);
end

tt=0:0.001:T;
yy=cos(10*tt);

figure(1)
plot(t,y,'bo',tt,yy)
%plot(t,u(1,:),'r')
xlabel('t')
ylabel('y');
title('Mitt fjärde ODE program');

fel=abs(yy(end)-y(end)); % Felet vid sluttiden. 

% Beräkna felet för två olika värden på k (k1 och k2), med samma sluttid T.
% Konvergensen q kan testas med hälp av två eller fler beräkningar
% med olika tiddsteg. 
% q=log(fel(k1)/fel(k2))/log(k1/k2)
% 
% Om felen blir väldigt små kan man få märklig konvergens. Detta kan hända 
% om ni: 
%
% 1) väljer sluttid när felet är nära noll (notera att felet beter sig
% på liknande sätt som lösningen (dvs periodisk i detta fall). Ni kan testa
% att plotta felet som funktion av tiden för att se detta. 
%
% 2) Ni har valt så små tidssteg att avrundningsfel börjar dominera
%
% Om man väljer tidssteg så att det blir numeriskt instabilt kan man inte
% mäta konvergens. Man ska heller undvika tidssteg som ligger nära gränsen 
% för stabilitet. När tidsstegen blir mindre brukar det bli noggrannare
% beräkning av konveregens (förutsatt att ni inte är nära avrundningsfel)
% som styrs av maskinepsilon (eps i Matlab). 

% figure(2)
% plot(t,abs(u),'ro')
% xlabel('t')
% ylabel('||u||');
% title('Mitt första ODE program');


