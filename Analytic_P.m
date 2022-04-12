function [y] = Analytic_P(t)
% Analytiska funktion (2) i projekt 1.
% BV2 kursen 2020.
y=exp(-t) .* sin(0.10e2 * t) .* (pi ^ 4 + pi ^ 3 - 198 * pi ^ 2 - 99 * pi + 
10201) ./ (pi ^ 4 - 198 * pi ^ 2 + 10201) ./ 0.10e2 + exp(-t) .* cos(0.10e2 * t) .*
(pi ^ 4 - 198 * pi ^ 2 + 2 * pi + 10201) ./ (pi ^ 4 - 198 * pi ^ 2 + 10201) + (-
sin(pi * t) * (pi ^ 2) - 0.2e1 * pi * cos(pi * t) + 0.101e3 * sin(pi * t)) / (pi ^ 
4 - 198 * pi ^ 2 + 10201);
end