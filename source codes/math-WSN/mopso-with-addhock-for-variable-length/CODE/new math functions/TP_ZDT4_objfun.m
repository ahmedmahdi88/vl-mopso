function [y, cons] = TP_ZDT4_objfun(x)
% Objective function : Test problem 'ZDT4'.
%*************************************************************************


y = [0, 0];
cons = [];

x2=x(2:end);
base=length(x2)*10+1;
g=base+sum((x2.^2-10*cos(4*pi*x2)));
h=1-sqrt((x(1)/g));

y(1) = x(1);
y(2) = g*h;
end




