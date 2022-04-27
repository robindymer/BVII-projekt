a = 0;
g = 0;
f = 1;
% Key parameters for the computation
k = 0.025;
b = -1;
T = 10;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*y(i) + k^2*(b+b^2*k^2/12)*y(i);
end

% With time step 2k
kk = 2*k;
tt = 0:kk:T;
yy = zeros(1, length(tt));
yy(1) = f; % Initial value
yy(2) = (1 + kk^2/2*b + kk^4/24*b^2) * f;

for i=2:(length(tt)-1)
    yy(i+1) = -yy(i-1) + 2*yy(i) + kk^2*(b+b^2*kk^2/12)*yy(i);
end

analytical = @(x) cos(sqrt(abs(b))*x); % Trivial to solve analytically, with pen and paper

% Calculate the error and the convergence rate
error = abs(analytical(t(end))-y(end));
disp(error)
q2 = log(abs(analytical(t(end))-y(end))/abs(analytical(t(end))-yy(end)))/log(k/kk);
disp(q2)
