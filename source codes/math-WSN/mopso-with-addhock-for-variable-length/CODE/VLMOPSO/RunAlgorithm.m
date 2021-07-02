function [t,paretoFront,paretoSet ,NC,classes,pop]=RunAlgorithm(s,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w,pMutate,mutationRatio,Vmin,Vmax)
tic
[pop,NC,classes]= initialization(popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
for i=1:popSize
%     pop(i).cost= objfun(pop(i).pos,A,b,a,m);
%  pop(i).cost= objfun(pop(i).pos(1:pop(i).Dim));
pop(i).cost= objfun(pop(i).pos);
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
prog=['Scenario: ' num2str(s) ' from 10 Scenarios | iter:' num2str(iter) ' progress: ' num2str(ceil(100-(numberOfIter-iter)/numberOfIter*100)) '%'];
disp(prog);
%     fprintf('iter:%d   progress:%d (%) \n',iter,ceil(100-(numberOfIter-iter)/numberOfIter*100));
    for i=1:popSize
    
%         if b>length(a)
%             pop(i).pos(end+1:b)=0;
%              pop(i).vel(end+1:b)=0;
%               pop(i).pbest(end+1:b)=0;
%         end
% mn=min(pop(i).Dim,Rep(h).Dim);
%         pop(i).vel(1:mn)= w*pop(i).vel(1:mn)+ rand*(pop(i).pbest(1:mn)-pop(i).pos(1:mn)) +rand*(Rep(h).pos(1:mn)-pop(i).pos(1:mn));
pop(i).vel= w*pop(i).vel+ 2*rand(1,length(pop(i).vel)).*...
    (pop(i).pbest-pop(i).pos) +2*rand(1,length(pop(i).vel)).*...
    (Rep(h).pos-pop(i).pos);
%         pop(i).vel(pop(i).Dim+1: end)=0;
pop(i).vel(pop(i).vel<Vmin) = Vmin;
pop(i).vel(pop(i).vel>Vmax) = Vmax;
        tmp=  pop(i).pos + pop(i).vel;
%         tmp=pop(i).pos;
        
        tmp(tmp<lowerBound_pos)=lowerBound_pos;
        tmp(tmp>heigherBound_pos)=heigherBound_pos;
%         tmp=round(tmp);
%         tmp(1:pop(i).Dim)=checkBounds( tmp(1:pop(i).Dim));
%%%%%%%%%%%%%%% Mutation
if rand<pMutate
%           tmp(1:pop(i).Dim)=mutationPso(tmp(1:pop(i).Dim),mutationRatio,lowerBound_pos,heigherBound_pos);
tmp = mutationPso(tmp,mutationRatio,lowerBound_pos,heigherBound_pos);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          tmp(pop(i).Dim+1: end)=100;
     
%         tmp_cost= objfun(tmp,A,b,a,m); 
%         tmp_cost= objfun(tmp(1:pop(i).Dim)); 
tmp_cost= objfun(tmp);
        if(Dominates(tmp_cost,pop(i).cost))
        pop(i).pos=tmp;
        end

%         pop(i).cost=objfun(pop(i).pos,A,b,a,m);
% pop(i).cost=objfun(pop(i).pos(1:pop(i).Dim));
pop(i).cost=objfun(pop(i).pos);
%         objs=[objs;pop(i).cost];
%         if iter>1
%         C(i)=setcoverage2(objs(i));
%         end
%         if Dominates( pop(i).cost, objfun(pop(i).pbest,A,b,a,m))
% if Dominates( pop(i).cost, objfun(pop(i).pbest(1:pop(i).Dim)))
if Dominates( pop(i).cost, objfun(pop(i).pbest))
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
%    w = w*0.99; 
end
pop=DetermineDomination(pop);
n=NDS(pop);
paretoFront=[];
paretoSet=[];
for i=1:length(pop)
    if pop(i).IsDominated==0
       Rep=[Rep pop(i)];
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
%     for i=1:numel(Rep)
%          Rep(i)=FindGridIndex(Rep(i),Grid);
%        gi(i)=Rep(i).GridIndex;
%     end
%     uniq=(unique(gi));
%      while numel(Rep)>RepSize
%         Rep=deleteFromRep(uniq,Rep);
%     end
    for i=1:length(Rep)
       paretoFront=[paretoFront ;Rep(i).cost];  
    end
   paretoSet=Rep;
   
t=toc;    
end



