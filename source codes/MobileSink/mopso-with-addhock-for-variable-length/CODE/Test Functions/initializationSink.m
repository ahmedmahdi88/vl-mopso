function [pop, numberOfClasses, classes,env]= initialization(nSensors,popSize,nobj,lowerBound_pos,higherBound_pos,lowerBound_dim,higherBound_dim)
pop(popSize)=struct();
classes=zeros(1,popSize);
env=initializeSink(10,nSensors);
for i=1:popSize
    posDim=round(unifrnd(lowerBound_dim,higherBound_dim));
    pop(i).Dim=posDim;
    classes(i)=posDim;
    env.rndVoz=[];
    for r=1:posDim
    env.rndVoz(r).x=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).Dim);
    env.rndVoz(r).y=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).Dim);
    end
pop(i).pos.x=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).Dim);
pop(i).pos.y=unifrnd(lowerBound_pos,higherBound_pos,1,pop(i).Dim);
   
%     pop(i).pos=unifrnd(lowerBound_pos,higherBound_pos,2,posDim);
% pop(i).pos.x=[];
% pop(i).pos.y=[];
for r=1:posDim
% pop(i).pos.x=[pop(i).pos.x env.rndVoz(r).x];
% pop(i).pos.y=[pop(i).pos.y env.rndVoz(r).y];
pop(i).vel.x(r)=0;
pop(i).vel.y(r)=0;
end
pop(i).pos=checkBoundsSink(pop(i).pos,pop(i).Dim,env);
cov=computeCov(pop(i).pos,env);
cc=0;
xSensors=zeros(1,length(env.sensors));
ySensors=xSensors;
for s=1:length(xSensors)
    xSensors(s)= env.sensors(s).x;
    ySensors(s)=env.sensors(s).y;
end
%%%%%%%%%%%%%%%%%%%%
while cov<0.8
    cc=cc+1;
     if cc>50
         if posDim+1>higherBound_dim
            posDim= higherBound_dim;
         else
         posDim=posDim+1;
         end
     end
      classes(i)=posDim;
         newX=zeros(1,posDim);
         newY=newX;
         for nxy=1:length(newX)
     rndIndx=round(unifrnd(1,length(xSensors)));
     newX(nxy)=round(unifrnd(xSensors(rndIndx)+0.1,xSensors(rndIndx)+3),1);
     newY(nxy)=round(unifrnd(ySensors(rndIndx)+0.1,ySensors(rndIndx)+3),1);
         end
     pop(i).Dim=posDim;
    pop(i).pos.x=newX;
     pop(i).pos.y=newY;
     pop(i).pos=checkXYBounds(pop(i).pos,lowerBound_pos,higherBound_pos);
     pop(i).pos=checkBoundsSink(pop(i).pos,pop(i).Dim,env);
     cov=computeCov(pop(i).pos,env);
end
pop(i).pos.x( pop(i).Dim+1:higherBound_dim)=-1;
    pop(i).pos.y( pop(i).Dim+1:higherBound_dim)=-1;
%%%%%%%%%%%%%%%%%%%%%%
pop(i).vel.x=zeros(1,length(pop(i).pos.x));
pop(i).vel.y=zeros(1,length(pop(i).pos.y));
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
