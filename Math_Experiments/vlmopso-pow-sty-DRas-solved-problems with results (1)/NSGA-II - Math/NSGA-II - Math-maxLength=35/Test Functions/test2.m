function f= test2(x)
if x<=1
f1=-x;

elseif x>1 && x<=3
f1=-2+x;
elseif x>3 && x<=4
    f1=4-x;
else
    f1=-4+x;
end
f2=(x-5).^2;
f=[f1,f2];
end
