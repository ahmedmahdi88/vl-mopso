function [pop, numberOfClasses, classes,env]= initialization(nSensors,popSize,nobj,lowerBound_pos,higherBound_pos,lowerBound_dim,higherBound_dim)
pop(popSize)=struct();
classes=zeros(1,popSize);
env=initializeSink(10,nSensors);
for i=1:popSize
    posDim=round(unifrnd(lowerBound_dim,higherBound_dim));
    pop(i).dim=posDim;
    classes(i)=posDim;
    env.rndVoz=[];
%     for r=1:posDim
%     env.rndVoz(r).x=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).dim);
%     env.rndVoz(r).y=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).dim);
%     end
pop(i).pos.x=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).dim);
pop(i).pos.y=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).dim);
    
%     pop(i).pos=unifrnd(lowerBound_pos,higherBound_pos,2,posDim);
% pop(i).pos.x=[];
% pop(i).pos.y=[];
for r=1:posDim
% pop(i).pos.x=[pop(i).pos.x env.rndVoz(r).x];
% pop(i).pos.y=[pop(i).pos.y env.rndVoz(r).y];
pop(i).vel.x(r)=0;
pop(i).vel.y(r)=0;
end
xSensors=zeros(1,length(env.sensors));
ySensors=xSensors;
for s=1:length(xSensors)
    xSensors(s)= env.sensors(s).x;
    ySensors(s)=env.sensors(s).y;
end
%%%%%%%%%%%%%%%%%%%%
sensorPos.x=xSensors;
sensorPos.y=ySensors;
covThreshold=0.8;
DistThreShold=3;
AddedSensorsThreshold=ceil(nSensors/length(pop(i).pos.x));
pop(i).pos=RVP_CheckConstraints(pop(i).pos,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,higherBound_pos)

%%%%%%%%%%%%%%%%%%%%%%
pop(i).vel.x=zeros(1,length(pop(i).pos));
pop(i).vel.y=zeros(1,length(pop(i).pos));
% pop(i).pos=rand(1,posDim);
    pop(i).cost=zeros(1,nobj);
     pop(i).cont=0;
    pop(i).IsDominated=false;
    pop(i).pbest=pop(i).pos;
    pop(i).GridIndex=[];
    pop(i).GridSubIndex=[];
end
numberOfClasses= length(unique(classes));
classes= unique(classes);
end
