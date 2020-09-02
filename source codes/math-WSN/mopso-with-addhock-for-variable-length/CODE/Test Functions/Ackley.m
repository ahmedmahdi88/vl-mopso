function f= Ackley(x)
D=length(x);
y1=-20*exp(-0.2*sqrt((1/D)*sum(x.^2)))
y2=-exp((1/D)*sum(cos(2*pi*x)))
y3=20+exp(1);
f=y1+y2+y3;
end