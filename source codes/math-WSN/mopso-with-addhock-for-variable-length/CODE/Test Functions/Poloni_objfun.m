function y = Poloni_Objfun(x)

% Poloni's Problem (POL)
% CATEGORY: 2-DIMENSIONS
% Number of objectives: 2
% Objective: minimization
% Range of initial points: -pi <= xj <= pi , j=1,2
% Pareto-optimal solutions are hard to be obtained here

a1 = 0.5*sin(1)-2*cos(1)+sin(2)-1.5*cos(2);
a2 = 1.5*sin(1)-cos(1)+2*sin(2)-0.5*cos(2);
b1 = 0.5.*sin(x(1))-2.*cos(x(1))+sin(x(2))-1.5.*cos(x(2));
b2 = 1.5.*sin(x(1))-cos(x(1))+2.*sin(x(2))-0.5.*cos(x(2));

y(1) =  1+(a1-b1).^2+(a2-b2).^2;
y(2) = (x(1)+3).^2+(x(2)+1).^2;

end