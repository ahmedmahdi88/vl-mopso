function visualizeSink(env,pos)
% example: after execute addRequiredPath and get paretoSolutions in
% workspace, run visualizeSink(env,pos)
% where pos is stored in paretoSet,paretoSetvl, pns
W=20;
H=20;
sensorsRadius=1;
rendiRadius=2;
A=W*H;
env.xCoordinates=0:0.1:W-0.1;
env.yCoordinates=0:0.1:H-0.1;
env.rndVoz=[];
for i=1:length(pos.x(pos.x~=-1))
env.rndVoz(i).x=pos.x(i);
env.rndVoz(i).y=pos.y(i);
end
theta = 0 : 0.01 : 2*pi;
for is=1:length(env.sensors)
       one= plot(env.sensors(is).x,env.sensors(is).y,'bp');xlim([0 W]);ylim([0 H]);
        hold on;
        thisX = sensorsRadius * cos(theta) + env.sensors(is).x;
        thisY = sensorsRadius * sin(theta) + env.sensors(is).y;
       two= plot(thisX,thisY,'g');
end
x=env.rndVoz(:).x;
x=x(x~=-1);
y=env.rndVoz(:).y;
y=y(y~=-1);
for ir=1:length(env.rndVoz)
        three=plot(env.rndVoz(ir).x,env.rndVoz(ir).y,'ko');xlim([0 W]);ylim([0 H]);
        
        thisX = rendiRadius * cos(theta) + env.rndVoz(ir).x;
        thisY = rendiRadius * sin(theta) + env.rndVoz(ir).y;
       four= plot(thisX,thisY,'r');
end
env.robot.start.x=W-1;
env.robot.start.y=H-1;
env.robot.visitedPos=[];
plotHandle = plot(env.robot.start.x,env.robot.start.y,'md','MarkerSize',20);
x=env.robot.start.x;
y=env.robot.start.y;
for k=1:length(env.rndVoz)
    x=[x env.rndVoz(k).x];
    y=[y env.rndVoz(k).y];
end
startPoint=env.robot.start;
travelPoints=[startPoint.x startPoint.y];
% finding Shortest Path
xy=travelPoints;
for j=1:length(pos.x(pos.x~=-1))
%     if pos.x(j)~=-1
        xy=[xy;pos.x(j) pos.y(j)];
%     end
end

for i=1:length(pos.x(pos.x~=-1))+1
for j=1:length(pos.x(pos.x~=-1))+1
D(i,j)=equlidianDist(xy(i,:),xy(j,:));
if D(i,j)==0
    D(i,j)=inf;
end
end
end
notVisitedNodes=2:size(D,2);
currentNode=1;
count=1;
seq=currentNode;
while count<size(D,2)
    [m(currentNode),vn]= min(D(currentNode,notVisitedNodes));
    indd=vn;
    currentNode=notVisitedNodes(indd);
    notVisitedNodes(indd)=[];
    count=count+1;
    seq=[seq currentNode];
end
seq=[seq 1];
% end finding shortest path
% x=[x env.robot.start.x];
% y=[y env.robot.start.y];
for k=1:length(seq)-1
     pause(0.5);
     set(plotHandle,'XData',xy(seq(k+1),1),'YData',xy(seq(k+1),2));
    five= plot([xy(seq(k),1) xy(seq(k+1),1)],[xy(seq(k),2) xy(seq(k+1),2)],'Color',[0.8 0 1]);

end
% title(['Time: ' num2str(paretoFront(idx,1)) ' | Energy: ' num2str(paretoFront(idx,2))]);
legend([one,two,three,four,plotHandle,five],'sensor','sensor range','rvp','rvp range',...
    'robot','robot path','Location','eastoutside','Orientation','vertical')
hold off;
end




