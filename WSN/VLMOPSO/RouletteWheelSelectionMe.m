function i=RouletteWheelSelectionMe(p)
p=sort(p);
p=(1-p)/sum(p);
r=rand;
i=1;
while r>0
    r=r-p(i);
    i=i+1;
end
i=i-1;
end
