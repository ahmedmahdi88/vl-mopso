function f= Weierstrass(x)
D=length(x);
a=0.5;b=3;k=[0:20];
a=a.^k;
b=b.^k;
f=0;
for i=1:length(k)
f= f+sum(sum(a(i).*cos(2*pi*b(i).*(x+0.5))))-D*sum(a(i).*cos(2*pi*b(i).*0.5));
end