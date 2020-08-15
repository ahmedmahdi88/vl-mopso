function [sensors,stratPoint,rendivouzPoints]=initializeSink(numberOfSensors)
W=20;
H=20;
r=1;
r_sink=2;
A=W*H;
% numberOfSensors=30;
environment=1:A;
env=reshape(environment,10,10)';
sensorsPos=[];
for sen=1:numberOfSensors
sensors(sen).pos=round(unifrnd(1,A));
sensorsPos=[sensorsPos sensors(sen).pos];
end
duplicate_ind=[];
while length(unique(sensorsPos))~=length(sensorsPos)
   [~, ind] = unique(sensorsPos);
 duplicate_ind = setdiff(1:length(sensorsPos), ind);
    sensorsPos(duplicate_ind)=round(unifrnd(1,A,1,length(duplicate_ind)));
end
for sen=1:numberOfSensors
sensors(sen).pos=sensorsPos(sen);
end

ind=[];
for p=1:length(sensors)
ind=[ind find(env==sensors(p).pos)];
end
[j,i] = ind2sub([W H],ind);
theta = 0 : 0.01 : 2*pi;
% for ix=1:length(i)
% 
%         plot(i(ix),j(ix),'bx');xlim([1 W]);ylim([1 H]);
%         grid on;hold on;
%         thisX = r * cos(theta) + i(ix);
%         thisY = r * sin(theta) + j(ix);
%         plot(thisX,thisY,'g');hold on;
% end
end