function f=Schwefel(x)
D=length(x);
s=sum(x.*sin(sqrt(abs(x))));
f= 418.9829*D;
f=f-s;
end