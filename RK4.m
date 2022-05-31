% Define necessary parameters for the computation
t0 = 0;
k = 0.02;
T = 1;
t = t0:k:T;
f = 1;

y = zeros(2, length(t));
% Initial values
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

% Graph the numerical and analytical solution
hold on
plot(t, y(2,:), 'bo')
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
k2 = 2*k;
t2 = t0:k2:T;

y2 = zeros(2, length(t2));
y2(1,1) = 0;
y2(2,1) = f;

for i=1:(length(t2)-1)
    % RK4 algorithm
    t_n = t2(i);
    u_n = y2(:,i);
    w1 = F(t_n, u_n);
    w2 = F(t_n + k2/2, u_n + k2/2*w1);
    w3 = F(t_n + k2/2, u_n + k2/2*w2);
    w4 = F(t_n + k2, u_n + k2*w3);
    u_next = u_n + k2*(w1 + 2*w2 + 2*w3 + w4)/6;
    y2(:,i+1) = u_next;
end

% -- If we want to take into account each error --
% err1 = zeros(1, length(t));
% err2 = zeros(1, length(t2));
% 
% for i=1:length(t)
% %     Since we need to compare the same number of data points
%     if (rem(i+1,2) == 0)
%         err1(i) = anal(t(i)) - y(2,i);
%     end
% end
% for i=1:length(t2)
%     err2(i) = anal(t2(i)) - y2(2,i);
% end
% q = log10(norm(err1)/norm(err2))/log10(k/k2);
% disp(q);
% error = abs(norm(err1)-anals(end));
% disp(error)

% Calculate the error and the convergence rate
error = abs(anals(end)-y(2, end));
disp(error)
q2 = log(abs(anals(end)-y(2, end))/abs(anals(end)-y2(2, end)))/log(k/k2);
disp(q2)