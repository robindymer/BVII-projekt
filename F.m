function uOut = F(t, ySys)
%F Summary of this function goes here
%   Detailed explanation goes here

a = -2;
b = -101;
g = @(t) sin(pi*t);

w = ySys(1);
y = ySys(2);
wOut = a*w + b*y + g(t);
yOut = w;

uOut = [wOut; yOut];
end

