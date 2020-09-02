clear;clc;close all;
% env=0.1:0.1:10;
% size(env)
% env=reshape(env,[10,10])';
% siz=[10,10];
W=100;
H=100;
r=5;
A=W*H;
a=10;b=10;m=10;
% numberOfSensors=30;
x=0.1:0.1:10;
y=x;
[X,Y]=meshgrid(x,y);
environment=1:10000;
env=reshape(environment,100,100)';
sensorsPos=[];
numberOfSensors=20;
for sen=1:numberOfSensors
sensors(sen).pos=(unifrnd(1,A));
sensorsPos=[sensorsPos sensors(sen).pos];
end
duplicate_ind=[];
while length(unique(sensorsPos))~=length(sensorsPos)
   [~, ind] = unique(sensorsPos);
 duplicate_ind = setdiff(1:length(sensorsPos), ind);
    sensorsPos(duplicate_ind)=(unifrnd(1,A,1,length(duplicate_ind)));
end
for sen=1:numberOfSensors
sensors(sen).pos=sensorsPos(sen);
end


for sen=1:length(sensors)
sensors(sen).coverage=[sensors(sen).pos sensors(sen).pos+r sensors(sen).pos-r sensors(sen).pos+W sensors(sen).pos-W];
end
% for sen=1:numberOfSensors
cov=[];
for sen=1:numberOfSensors
cov=[cov sensors(sen).coverage];
end    
  cov(cov<1 | cov>(W*H))=[];
  cov=unique(cov);
  lenCov=length(cov);
ind=[];
for p=1:length(sensors)
ind=[ind sensors(p).pos];
end
[j,i] = ind2sub([W H],ind);
theta = 0 : 0.01 : 2*pi;
for ix=1:length(i)
        plot(i(ix),j(ix),'bx');xlim([1 W]);ylim([1 H]);
        hold on;
        thisX = r * cos(theta) + i(ix);
        thisY = r * sin(theta) + j(ix);
        plot(thisX,thisY,'g');hold on;
end

