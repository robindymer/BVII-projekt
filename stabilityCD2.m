a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = 0.3;
b = -100;
T = 100;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
end

hold on
plot(t, y, 'bo');
t2 = linspace(0, T, 100);
analytical = @(t) cos(sqrt(abs(b))*t); % Trivial to solve analytically, with pen and paper
plot(t2, analytical(t2));
hold off
