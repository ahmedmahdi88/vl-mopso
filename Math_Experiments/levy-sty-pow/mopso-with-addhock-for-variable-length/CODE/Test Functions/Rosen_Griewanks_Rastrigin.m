function f=Rosen_Griewanks_Rastrigin(x)
f(1)=-RosenbrockObjFun(x);
f(2)=Griewanks(x);
f(3)=-Rastrigin(x);
end