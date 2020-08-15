clear;clc;close all;
for i=1:100
    dim=i;
%     x=unifrnd(-600,600,1,dim);
    x=[unifrnd(-33,33,1,dim)];
[y(:,:,i)]=ObjectiveFuc(x);
end
y1=reshape(y(:,1,:),[100,1])
y2=reshape(y(:,2,:),[100,1])

 plot(y1);
hold on;
plot(y2)
legend('f1','f2')
