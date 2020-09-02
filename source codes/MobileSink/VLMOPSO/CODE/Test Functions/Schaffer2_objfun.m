function y = Schaffer2_objfun(x)

% Schaffer's Problem No.2 (SCH2)
% CATEGORY: 1-DIMENSION
% Number of objectives: 2
% Objective: minimization
% Range of initial points: -5 <= x <= 10
% Pareto optimal solutions: x = {[1 2]U[4 5]}

y(1) = -x.*(x<=1) + (x-2).*(1<x & x<=3) + (4-x).*(3<x & x<=4) + (x-4).*(x>4);
y(2) = (x-5).^2;

end