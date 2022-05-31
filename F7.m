function uOut = F7(t, ySys)
%F7 Defines the linear ODE of two variables used in problem 7
% Given a time t and a values for y and w, return the defined ODE

b = -1;

w = ySys(1);
y = ySys(2);
wOut = b*y;
yOut = w;

uOut = [wOut; yOut];
end