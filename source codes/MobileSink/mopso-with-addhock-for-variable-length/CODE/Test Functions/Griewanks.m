function f= Griewanks(x)
D=length(x);
f=sum(((x.^2)/4000))-prod(cos(x./sqrt(1:D)))+1;
end