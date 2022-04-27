a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = 0.5;
b = -1;
T = 1000;
t0 = 0;
t = t0:k:T;

y = zeros(2, length(t));
y(1,1) = 0;
y(2,1) = f;

for i=1:(length(t)-1)
    % RK4 algorithm
    t_n = t(i);
    u_n = y(:,i);
    w1 = F(t_n, u_n);
    w2 = F(t_n + k/2, u_n + k/2*w1);
    w3 = F(t_n + k/2, u_n + k/2*w2);
    w4 = F(t_n + k, u_n + k*w3);
    u_next = u_n + k*(w1 + 2*w2 + 2*w3 + w4)/6;
    y(:,i+1) = u_next;
end

% Plotta numeriska energi som funktion av tiden
E=y(1,:).^2-b*y(2,:).^2;
figure(2)
plot(t,E)
xlabel('t')
ylabel('E=y_t^2+\b y^2');
