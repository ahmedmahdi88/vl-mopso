function env=initializeSink(rendiVouzPoints,numberOfSensors)
W=20;
H=20;
sensorsRadius=1;
rendiRadius=2;
A=W*H;
env.xCoordinates=0:0.1:W-0.1;
env.yCoordinates=0:0.1:H-0.1;

for sen=1:numberOfSensors
sensors(sen).x=unifrnd(0,W-0.1);
sensors(sen).y=unifrnd(0,H-0.1);
sensorsPos(sen)=sqrt((sensors(sen).x)^2+(sensors(sen).y)^2);
end
duplicate_ind=[];
while length(unique(sensorsPos))~=length(sensorsPos)
   [~, ind] = unique(sensorsPos);
 duplicate_ind = setdiff(1:length(sensorsPos), ind);
 sensors(duplicate_ind).x=unifrnd(0,W-0.1,1,length(duplicate_ind));
  sensors(duplicate_ind).y=unifrnd(0,H-0.1,1,length(duplicate_ind));
  sensorsPos(duplicate_ind)=sqrt((sensors(duplicate_ind).x).^2+(sensors(duplicate_ind).y).^2);
end
env.sensors=sensors;
for rv=1:rendiVouzPoints
rndVoz(rv).x=unifrnd(0,W-0.1);
rndVoz(rv).y=unifrnd(0,H-0.1);
rndVozPos(rv)=sqrt((rndVoz(rv).x)^2+(rndVoz(rv).y)^2);
end

duplicate_ind=[];
while length(unique(rndVozPos))~=length(rndVozPos)
   [~, ind] = unique(rndVozPos);
 duplicate_ind = setdiff(1:length(rndVozPos), ind);
 rndVoz(duplicate_ind).x=unifrnd(0,W-0.1,1,length(duplicate_ind));
  rndVoz(duplicate_ind).y=unifrnd(0,H-0.1,1,length(duplicate_ind));
  rndVozPos(duplicate_ind)=sqrt((rndVoz(duplicate_ind).x).^2+(rndVoz(duplicate_ind).y).^2);
end
ind=[];
while ismember(rndVozPos,sensorsPos)~=0
for rv=1:length(rndVozPos)
   if(ismember(rndVozPos(rv),sensorsPos))
       ind=[ind,rv];
   end

 rndVoz(ind).x=unifrnd(0,W-0.1,1,length(ind));
  rndVoz(ind).y=unifrnd(0,H-0.1,1,length(ind));
  rndVozPos(ind)=sqrt((rndVoz(ind).x).^2+(rndVoz(ind).y).^2);
end
end
env.rndVoz=rndVoz;
theta = 0 : 0.01 : 2*pi;
for is=1:length(env.sensors)
        plot(env.sensors(is).x,env.sensors(is).y,'bx');xlim([0 W]);ylim([0 H]);
        hold on;
        thisX = sensorsRadius * cos(theta) + env.sensors(is).x;
        thisY = sensorsRadius * sin(theta) + env.sensors(is).y;
        plot(thisX,thisY,'g');hold on;
end

for ir=1:length(env.rndVoz)
        plot(env.rndVoz(ir).x,env.rndVoz(ir).y,'kx');xlim([0 W]);ylim([0 H]);
        hold on;
        thisX = rendiRadius * cos(theta) + env.rndVoz(ir).x;
        thisY = rendiRadius * sin(theta) + env.rndVoz(ir).y;
        plot(thisX,thisY,'r');hold on;
end
env.robot.start.x=W-1;
env.robot.start.y=H-1;
env.robot.visitedPos=[];

plot(env.robot.start.x,env.robot.start.y,'md','MarkerSize',20)
hold off;
end




