t0 = 0;
k = 0.04;
T = 1;
t = t0:k:T;
f = 1;

y = zeros(2, length(t));
y(1,1) = 0;
y(2,1) = f;

% Convergence rate
q = zeros(length(t), 1);

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

hold on
plot(t, y(2,:))
anals = zeros(length(t), 1);
for i=1:length(anals)
    anals(i) = anal(t(i));
end
plot(t, anals)
hold off

% Anal the error
e = norm(anals(length(anals))-y(2,length(t)));
disp(e)

% Convergence calculations
% Compare timestep k and 2k
q = log10(norm())