function ut = F5(t,u)
% Mitt HL till ODE problemet
% HL=A*u, A=[0 1;gamma 0]

global gamma

ut=[0 1;gamma 0]*u;

end

