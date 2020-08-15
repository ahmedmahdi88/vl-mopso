function f=powell_sphere_schwefel(x)
f(1)=powell(x);
f(2)=sphere(x);
f(3)=-Schwefel(x);
end