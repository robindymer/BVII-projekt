function uOut = F(t, ySys)
%F Defines a linear ODE of two variables
% Given a time t and a values for y and w, return the defined ODE

a = -2;
b = -101;
g = @(t) sin(pi*t);

w = ySys(1);
y = ySys(2);
wOut = a*w + b*y + g(t);
yOut = w;

uOut = [wOut; yOut];
end

