a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = 0.04;
b = -1;
T = 100;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
end

% With time step 2k
kk = 2*k;
tt = 0:kk:T;
yy = zeros(1, length(tt));
yy(1) = f; % Initial value
yy(2) = (1 + kk^2/2*b) * f;

for i=2:(length(tt)-1)
    yy(i+1) = -yy(i-1) + 2*(1+b*kk^2/2)*yy(i);
end

analytical = @(x) cos(sqrt(abs(b))*x); % Trivial to solve analytically, with pen and paper

err1 = zeros(1, length(t));
err2 = zeros(1, length(tt));

for i=1:length(t)
    err1(i) = analytical(t(i)) - y(i);
end
for i=1:length(tt)
    err2(i) = analytical(tt(i)) - yy(i);
end
q = log10(norm(err1)/norm(err2))/log10(k/kk);
disp(q);

% tSkip = t(1:2:end);
% ySkip = y(1:2:end);
% qn = log10(norm(analytical(t)-y)/norm(analytical(tSkip)-ySkip))/log10(k/kk);
% disp(qn)

hold on
% plot(t, y, 'bo');
% t2 = linspace(0, T, 100);
% plot(t2, analytical(t2));
plot(t, err1);
plot(tt, err2, 'bo');
hold off