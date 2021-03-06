a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = 0.5;
b = -1;
T = 10000;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
E = zeros(1, length(t));
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
    E(i) = ((y(i+1)-y(i-1))/(2*k))^2 - b*y(i)^2;
end

% Plotta numeriska energi som funktion av tiden
disp(E(end-1))
figure(2)
plot(t,E)
xlabel('t')
ylabel('E = y(n+1)-y(n-1)/(2k)^2-b\cdot y(n)^2');
title('E(t) for CD4');