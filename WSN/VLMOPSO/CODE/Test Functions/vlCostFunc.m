function f= vlCostFunc(x)
% f(1)=sum(x.^2);
x1=x(1:end-1);
x2=x(2:end);
% f(1)=sum(100*(x1.^2-x2).^2+(x1-1).^2);
% D=length(x);
% f(1)= -20*exp(-0.2*sqrt((1/D)*sum(x.^2)))-exp((1/D)*sum(cos(2*pi*x)))+20+exp(1);
% f(2)=sum(x.^2/4000)-prod(cos(x./(1:length(D))))+1;
% % f(1)=-f(1);
% % f(2)=-f(2);
end
