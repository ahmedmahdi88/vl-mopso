function [pop,env,paretoFront,paretoSet ,NC,classes]=RunAlgorithm(nSensors,scenario,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w)
[pop,NC,classes,env]= initializationSink(nSensors,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
for i=1:popSize
    pop(i).cost= objfun(pop(i).pos,env);
%  pop(i).cost= objfun(pop(i).pos);
end

pop=DetermineDomination(pop);
n=NDS(pop);
Rep= [];

for i=1:popSize
    if ~pop(i).IsDominated
        if length(Rep)== RepSize
            Rep= deleteFromRep(uniq,Rep);
            
        else
            Rep= [Rep pop(i)];
        end
    end
end

% a=[min(Rep.cost(1)) min(Rep.cost(2))];
% b=[max(Rep.cost(1)) max(Rep.cost(1))];
% c=[1 1];
% hyperCube = hypercube_grid ( nobj, length(Rep), ns, a, b, c );
Grid=CreateGrid(Rep,nGrid,alpha);

for i=1:numel(Rep)
    Rep(i)=FindGridIndex(Rep(i),Grid);
end
gi=zeros(1,numel(Rep));
for i=1:numel(Rep)
    gi(i)=Rep(i).GridIndex;
end
uniq=(unique(gi));
fitness= 10*ones(1,length(Rep));
counter=zeros(1,length(uniq));
for j=1:length(uniq)
    
    for i=1:numel(Rep)
        if Rep(i).GridIndex==uniq(j)
            counter(j)=counter(j)+1;
        end
    end
end

for j=1:length(uniq)
    
    for i=1:numel(Rep)
        if Rep(i).GridIndex==uniq(j)
            fitness(i)=10/counter(j);
        end
    end
end
P= fitness./sum(fitness);
h= RouletteWheelSelection(P);
C=zeros(1,numberOfIter-1);
objs=[];

% start iterations ..................................................

for iter=1:numberOfIter
    dims=[];
for i=1:numel(Rep)
    dims(i)=length(Rep(i).pos);
end
prog=['Scenario: ' num2str(scenario) ' from 10 Scenarios | iter:' num2str(iter) ' progress: ' num2str(ceil(100-(numberOfIter-iter)/numberOfIter*100)) '%'];
disp(prog);
%     fprintf('iter:%d   progress:%d (%) \n',iter,ceil(100-(numberOfIter-iter)/numberOfIter*100));
    for i=1:popSize
    
%         if b>length(a)
%             pop(i).pos(end+1:b)=0;
%              pop(i).vel(end+1:b)=0;
%               pop(i).pbest(end+1:b)=0;
%         end
% pop(i).vel.x
% pop(i).pbest.x
% Rep(h).pos.x
tmpPbest=pop(i).pbest;
tmpPbest.x(tmpPbest.x==-1)=0;
tmpPbest.y(tmpPbest.y==-1)=0;
tmpRep=Rep(h).pos;
tmpRep.x(tmpRep.x==-1)=0;
tmpRep.y(tmpRep.y==-1)=0;

    pop(i).vel.x(pop(i).pos.x~=-1)= w*pop(i).vel.x(pop(i).pos.x~=-1)+ rand*(tmpPbest.x(pop(i).pos.x~=-1)-pop(i).pos.x(pop(i).pos.x~=-1)) +rand*(tmpRep.x(pop(i).pos.x~=-1)-pop(i).pos.x(pop(i).pos.x~=-1));
    pop(i).vel.y(pop(i).pos.y~=-1)= w*pop(i).vel.y(pop(i).pos.y~=-1)+ rand*(tmpPbest.y(pop(i).pos.x~=-1)-pop(i).pos.y(pop(i).pos.y~=-1)) +rand*(tmpRep.y(pop(i).pos.x~=-1)-pop(i).pos.y(pop(i).pos.y~=-1));

        pop(i).vel.x(pop(i).Dim+1: end)=0;
        pop(i).vel.y(pop(i).Dim+1: end)=0;
        tmp.x=  pop(i).pos.x(pop(i).pos.x~=-1) + pop(i).vel.x(pop(i).pos.x~=-1);
        tmp.y=  pop(i).pos.y(pop(i).pos.y~=-1) + pop(i).vel.y(pop(i).pos.y~=-1);
        %         tmp=pop(i).pos;
%         tmp=checkBoundsSink( tmp,pop(i).Dim,env);
%         tmp.x(tmp.x<lowerBound_pos)=lowerBound_pos;
%         tmp.x(tmp.x>heigherBound_pos)=heigherBound_pos;
%         tmp.y(tmp.y<lowerBound_pos)=lowerBound_pos;
%         tmp.y(tmp.y>heigherBound_pos)=heigherBound_pos;
%         tmp.x=round(tmp);
        
        %%%%%%%%%
        cov=computeCov(tmp,env);
        xSensors=zeros(1,length(env.sensors));
        ySensors=xSensors;
        for s=1:length(xSensors)
            xSensors(s)= env.sensors(s).x;
            ySensors(s)=env.sensors(s).y;
        end
        sensorPos.x=xSensors;
        sensorPos.y=ySensors;
%         while(cov<0.8)
%             newX=zeros(size(tmp.x(tmp.x~=-1)));
%             newY=newX;
%             for nxy=1:length(newX)
%                 rndIndx=round(unifrnd(1,length(xSensors)));
%                 newX(nxy)=round(unifrnd(xSensors(rndIndx)+0.1,xSensors(rndIndx)+3),1);
%                 newY(nxy)=round(unifrnd(ySensors(rndIndx)+0.1,ySensors(rndIndx)+3),1);
%                 newX(newX<lowerBound_pos)=lowerBound_pos;
%                 newY(newY<lowerBound_pos)=lowerBound_pos;
%                 newX(newX>heigherBound_pos)=heigherBound_pos;
%                 newY(newY>heigherBound_pos)=heigherBound_pos;
%             end
%          tmp.x=newX;%round(unifrnd(0,19.9,1,length(tmp.x)),1);
%                tmp.y=newY;%round(unifrnd(0,19.9,1,length(tmp.y)),1);
%               
%                 [tmp]=checkBoundsSink(tmp,pop(i).Dim,env);
%                tmp.x(tmp.x<lowerBound_pos)=lowerBound_pos;
%                 tmp.y(tmp.y<lowerBound_pos)=lowerBound_pos;
%                  tmp.x(tmp.x>heigherBound_pos)=heigherBound_pos;
%                  tmp.y(tmp.y>heigherBound_pos)=heigherBound_pos;
               
%                cov=computeCov(tmp,env);
%                end
covThreshold=0.8;
            DistThreShold=3;
            AddedSensorsThreshold= ceil(nSensors/length(tmp.x));
            [tmp,~]= RVP_CheckConstraints(tmp,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,heigherBound_pos,pop(i).Dim);
         tmp.x(pop(i).Dim+1: higherBound_dim)=-1;
         tmp.y(pop(i).Dim+1: higherBound_dim)=-1;
        tmp_cost = objfun(tmp,env); 
%         tmp_cost= objfun(tmp); 
        if(Dominates(tmp_cost,pop(i).cost))
        pop(i).pos=tmp;
        end

        pop(i).cost=objfun(pop(i).pos,env);
% pop(i).cost=objfun(pop(i).pos);
%         objs=[objs;pop(i).cost];
%         if iter>1
%         C(i)=setcoverage2(objs(i));
%         end
%         if Dominates( pop(i).cost, objfun(pop(i).pbest,A,b,a,m))
if Dominates( pop(i).cost, objfun(pop(i).pbest,env))
            pop(i).pbest= pop(i).pos;
        end
    end
    pop=DetermineDomination(pop);
    n=NDS(pop);
    
    for i=1:popSize
        if ~pop(i).IsDominated
            
            Rep= [Rep pop(i)];
        end
    end
    Rep=DetermineDomination(Rep);
    ind=false(1,numel(Rep));
    for i=1:numel(Rep)
        if Rep(i).IsDominated
          ind(i)=true;
        end
    end
    Rep(ind)=[];
    while numel(Rep)>RepSize
        Rep=deleteFromRep(uniq,Rep);
    end
    Grid=CreateGrid(Rep,nGrid,alpha);
    
    for i=1:numel(Rep)
        Rep(i)=FindGridIndex(Rep(i),Grid);
    end
    gi=zeros(1,numel(Rep));
    for i=1:numel(Rep)
        gi(i)=Rep(i).GridIndex;
    end
    uniq=(unique(gi));
    fitness= 10*ones(1,length(Rep));
    counter=zeros(1,length(uniq));
    for j=1:length(uniq)
        
        for i=1:numel(Rep)
            if Rep(i).GridIndex==uniq(j)
                counter(j)=counter(j)+1;
            end
        end
    end
    
    for j=1:length(uniq)
        
        for i=1:numel(Rep)
            if Rep(i).GridIndex==uniq(j)
                fitness(i)=10/counter(j);
            end
        end
    end
    P=fitness./sum(fitness);
    h= RouletteWheelSelection(P);
    
end
pop=DetermineDomination(pop);
n=NDS(pop);
paretoFront=[];
paretoSet=[];
for i=1:length(pop)
    if pop(i).IsDominated==0
       paretoFront=[paretoFront;pop(i).cost];
       paretoSet=[paretoSet ; pop(i).pos];
    end
end

