function [pop, numberOfClasses, classes]= initialization(popSize,nobj,lowerBound_pos,higherBound_pos,lowerBound_dim,higherBound_dim)
pop(popSize)=struct();
classes=zeros(1,popSize);
for i=1:popSize
    posDim=round(unifrnd(lowerBound_dim,higherBound_dim));
    classes(i)=posDim;
%     [sensors,A,a,b,m]=initializeCOV(posDim);
    pop(i).pos=unifrnd(lowerBound_pos,higherBound_pos,1,posDim);
% pop(i).pos=[];
% pop(i).coverage=[];
% for s=1:length(sensors)
% pop(i).pos=[pop(i).pos sensors(s).pos];
% pop(i).coverage=[ pop(i).coverage sensors(s).coverage];
% end
% pop(i).pos=rand(1,posDim);
    pop(i).cost=zeros(1,nobj);
    pop(i).vel=zeros(1,posDim);
     pop(i).cont=0;
    pop(i).IsDominated=false;
    pop(i).pbest=pop(i).pos;
    pop(i).GridIndex=[];
    pop(i).GridSubIndex=[];
    pop(i).class = posDim;
end
numberOfClasses= length(unique(classes));
classes= unique(classes);

end
    