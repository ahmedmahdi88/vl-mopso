function [y]=ObjectiveFuc(x)

d=length(x);
y1=0;
for i=1:d
    
    
    y1=y1-x(i)^2;
    
end

y21=0;
for i=d
    
    y21=y21+x(i)^2/4000;
   
end

y22=1;

for i=d
    
    y22=y22*cos(x(i)/sqrt(i));
    
end

y2=y21-y22+1;

y(1)=y1;
y(2)=y2;

end