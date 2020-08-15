function visualizeSink(env,pos)
W=20;
H=20;
sensorsRadius=1;
rendiRadius=2;
A=W*H;
env.xCoordinates=0:0.1:W-0.1;
env.yCoordinates=0:0.1:H-0.1;
env.rndVoz=[];
for i=1:length(pos.x)
env.rndVoz(i).x=pos.x(i);
env.rndVoz(i).y=pos.y(i);
    end

theta = 0 : 0.01 : 2*pi;
for is=1:length(env.sensors)
        plot(env.sensors(is).x,env.sensors(is).y,'bx');xlim([0 W]);ylim([0 H]);
        hold on;
        thisX = sensorsRadius * cos(theta) + env.sensors(is).x;
        thisY = sensorsRadius * sin(theta) + env.sensors(is).y;
        plot(thisX,thisY,'g');hold on;
end

for ir=1:length(env.rndVoz)
    if env.rndVoz(ir).x~=-1
        plot(env.rndVoz(ir).x,env.rndVoz(ir).y,'kx');xlim([0 W]);ylim([0 H]);
        hold on;
        thisX = rendiRadius * cos(theta) + env.rndVoz(ir).x;
        thisY = rendiRadius * sin(theta) + env.rndVoz(ir).y;
        plot(thisX,thisY,'r');hold on;
    end
end
env.robot.start.x=W-1;
env.robot.start.y=H-1;
env.robot.visitedPos=[];
x=env.robot.start.x;
y=env.robot.start.y;
for k=1:length(env.rndVoz)
    if env.rndVoz(k).x~=-1 && env.rndVoz(k).y~=-1
    x=[x env.rndVoz(k).x];
    y=[y env.rndVoz(k).y];
    end
end
plotHandle = plot(env.robot.start.x,env.robot.start.y,'md','MarkerSize',20);
x=[x env.robot.start.x];
y=[y env.robot.start.y];
for k=2:length(x)
     pause(0.5);
     set(plotHandle,'XData',x(k),'YData',y(k));
     plot([x(k-1) x(k)],[y(k-1) y(k)],'Color',[0.8 0 1]);

end
hold off;
end




