% Parameters for the ODE
a = 0;
g = 0;
% Initial value
f = 1;

% Parameters for the computation
k = 0.30;
b = -100;
T = 100;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
% Fourth order approximation for the second value
y(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

% CD4 algorithm
for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*y(i) + k^2*(b+b^2*k^2/12)*y(i);
end

% Plot the numerical and analytical solution
hold on
plot(t, y, 'bo');
t2 = linspace(0, T, 100);
analytical = @(t) cos(t); % The analytical solution
plot(t2, analytical(t2));
hold off
