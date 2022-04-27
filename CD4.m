function yout = CD4(k, b, T)
%CD4 A numerical solution to CD4
a = 0;
g = 0;
f = 1;

t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*y(i) + k^2*(b+b^2*k^2/12)*y(i);
end

yout = y;
end

