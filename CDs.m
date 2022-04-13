a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = input("Time-step k: ");
b = input("Value for b: ");
T = input("End time T: ");

% SOLVE USING CD2
t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
end

% SOLVE USING CD4
y2 = zeros(1, length(t)); % Column vector
y2(1) = f; % Initial value
y2(2) = (1 + k^2/2*b) * f;

for i=2:(length(t)-1)
    y2(i+1) = -y2(i-1) + 2*y2(i) + k^2*(b+b^2*k^2/12)*y2(i);
end

hold on
plot(t, y, 'bo');
plot(t, y2, 'ro');

t2 = linspace(0, T, 100);
analytical = @(t) cos(sqrt(abs(b))*t); % Trivial to solve analytically, with pen and paper
plot(t2, analytical(t2));
hold off
