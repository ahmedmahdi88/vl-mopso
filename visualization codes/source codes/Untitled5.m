W=10;
H=10;
r=1;
A=W*H;
a=10;b=10;m=10;
% numberOfSensors=30;
environment=1:A;
env=reshape(environment,10,10)';
sensorsPos=[];numberOfSensors=100;
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
sensorsPos=[49,15,67,53,51,45,35,87,34,44,41,48,73,83,3,13,66,4,55,8,5,17,89,97,42,9,39,18,11,24,22,31,59,14,2,28,68,81,38,62,33,19,27,29,26,54,10,25,47,30,43,65,82,40,6,21,20,90,96,50,23,94,84,12,16,7,63,69,1,92,79,95,52,78,72,56];
for sen=1:76
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
ind=[ind find(env==sensors(p).pos)];
end
[j,i] = ind2sub([W H],ind);
theta = 0 : 0.01 : 2*pi;
for ix=1:length(i)

        plot(i(ix),j(ix),'bx');xlim([1 W]);ylim([1 H]);
        grid on;hold on;
        thisX = r * cos(theta) + i(ix);
        thisY = r * sin(theta) + j(ix);
        plot(thisX,thisY,'g');hold on;
        set(gcf,'units','normalized','outerposition',[0 0 1 1])
        set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
end