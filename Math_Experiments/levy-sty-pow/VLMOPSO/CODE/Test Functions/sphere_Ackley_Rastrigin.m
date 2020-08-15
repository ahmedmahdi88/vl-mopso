function f=sphere_Ackley_Rastrigin(x)
f(1)=-sum(x.^2);
f(2)=Ackley(x);
f(3)=DRastrigin(x);
end