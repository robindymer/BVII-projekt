% Parameters for the ODE
a = 0;
g = 0;
% Initial value
f = 1;

% Input from the user
k = input("Time-step k: ");
b = input("Value for b: ");
T = input("End time T: ");

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
% Second order approximation for the second value
y(2) = (1 + k^2/2*b) * f;

% CD2 algorithm
for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
end

y2 = zeros(1, length(t)); % Column vector
y2(1) = f; % Initial value
% Fourth order approximation for the second value
y2(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

% CD4 algorithm
for i=2:(length(t)-1)
    y2(i+1) = -y2(i-1) + 2*y2(i) + k^2*(b+b^2*k^2/12)*y2(i);
end

% Plot the numerical solutions (CD2 & CD4) and the analytical solution
hold on
plot(t, y, 'bo');
plot(t, y2, 'ro');
title('Unstable CD2')
ylabel('y(t)')
xlabel('t')

t2 = linspace(0, T, 100);
analytical = @(t) cos(sqrt(abs(b))*t); % Trivial to solve analytically, with pen and paper
plot(t2, analytical(t2));
legend('CD2', 'CD4', 'analytical')
hold off
