function costValues = TP_ZDT1_objfun(x)
% Objective function : Test problem 'ZDT1'.
%*************************************************************************


%y = [0, 0];

numVar = length(x);
g = 1 + 9*sum(x(2:numVar))/(numVar-1);


costValues(1) = x(1);
costValues(2) = g*(1-sqrt(x(1)/g));



