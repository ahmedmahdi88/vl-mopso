function f=DRastrigin(x)
y=zeros(size(x));
y(x<0.5)=x(x<0.5);
y(x>=0.5)=(round(2*x(x>=0.5)))/2;
f=sum(y.^2-10*cos(2*pi*y)+10);
end