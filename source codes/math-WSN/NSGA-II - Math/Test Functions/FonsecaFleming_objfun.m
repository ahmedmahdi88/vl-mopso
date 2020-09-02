function y = FonsecaFleming_objfun(x)

% Fonseca-Fleming's Problem (FON)
% CATEGORY: n-DIMENSIONS
% Number of objectives: 2
% Objective: minimization
% Range of initial points: -4 <= xj <= 4 , j=1,2,...,n
% Pareto optimal solutions: xj = [-1/n 1/n] , j=1,2,...,n
% Pareto solutions relationship: 0 =< f1 <= 1-exp(-4) , f2 = 1-exp(-(2-sqrt(-log2(1-f1)))^2) :

n = length(x);
y(1) =  1 - exp(-sum((x - 1/sqrt(n)).^2));
y(2) =  1 - exp(-sum((x + 1/sqrt(n)).^2));

end
