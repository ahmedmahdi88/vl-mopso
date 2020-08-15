function f2= RosenbrockObjFun(x)
x1=x(1:end-1);
x2=x(2:end);
f2= sum(100*(x1.^2-x2).^2+(x1-1).^2);
end