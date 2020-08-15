function f=Griewanks_sphere(x)
f(1)=Griewanks(x);
f(2)=-sum(x.^2);
end