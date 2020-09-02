function f=Rosen_Ackley_DRastrigin(x)
f(1)=RosenbrockObjFun(x);
f(2)=Ackley(x);
f(3)=-DRastrigin(x);
end