a = 0;
g = 0;
f = 1;
% INPUT TO THE PROGRAM
k = input("Time-step k: ");
b = input("Value for b: ");
T = input("End time T: ");

% SOLVE USING CD2
t = 0:k:T;
y = zeros(1, length(t)); % Column vector
y(1) = f; % Initial value
y(2) = (1 + k^2/2*b) * f;

for i=2:(length(t)-1)
    y(i+1) = -y(i-1) + 2*(1+b*k^2/2)*y(i);
end

% SOLVE USING CD4
y2 = zeros(1, length(t)); % Column vector
y2(1) = f; % Initial value
y2(2) = (1 + k^2/2*b + k^4/24*b^2) * f;

for i=2:(length(t)-1)
    y2(i+1) = -y2(i-1) + 2*y2(i) + k^2*(b+b^2*k^2/12)*y2(i);
end

hold on
plot(t, y, 'bo');
% plot(t, y2, 'ro');
title('Unstable CD2')
ylabel('y(t)')
xlabel('t')

t2 = linspace(0, T, 100);
analytical = @(t) cos(sqrt(abs(b))*t); % Trivial to solve analytically, with pen and paper
plot(t2, analytical(t2));
legend('CD2', 'analytical')
hold off

% For b = -1, find the largest possible time-step for CD4
% kVals = linspace(0.1, 10, 100000);
% kCurrent = 0;
% threshold = 0.5;
% 
% for i=1:length(kVals)
%     yk = CD4(kVals(i), -1, 10000);
%     % If it diverges, break the loop
%     if yk(end) > (1 + threshold) || yk(end) < (-1 - threshold)
%         break
%     end
%     kCurrent = kVals(i);
% end
% 
% disp(kCurrent)
