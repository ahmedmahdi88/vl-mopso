function f=powell_stybtang_DRastrigin(x)
f(1)=powell(x);
f(2)=stybtang(x);
f(3)=-DRastrigin(x);
end