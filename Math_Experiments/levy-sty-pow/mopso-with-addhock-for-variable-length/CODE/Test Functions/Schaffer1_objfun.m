function y = Schaffer1_objfun(x)

% Schaffer's Problem No.1 (SCH1)
% CATEGORY: 1-DIMENSION
% Number of objectives: 2
% Objective: minimization
% Range of initial points: -a <= x <= a , a is between 10 and 10^5
% Pareto optimal solutions: x = [0 2]
% Pareto solutions relationship: f2=(sqrt(f1)-2)^2

y(1) = x.^2;
y(2) = (x-2).^2;

end