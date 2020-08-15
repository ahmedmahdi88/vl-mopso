function f= covSensors(pos,lowerBound_pos,higherBound_pos)
W=10;
H=10;
r=1;
b=10;
a=10;
m=10;
x=pos(1,:);
y=pos(2,:);
aj=pi;
A=W*H;
for i=1:length(x)
    ind=find(x(i)~=x);
    while any(x(i)==x(ind))
        x(i)=unifrnd(lowerBound_pos,higherBound_pos);
    end
end
for i=1:length(y)
    ind=find(y(i)~=y);
    while any(y(i)==y(ind))
        y(i)=unifrnd(lowerBound_pos,higherBound_pos);
    end
end

        