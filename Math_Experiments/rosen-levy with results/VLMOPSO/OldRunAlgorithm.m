function [Rep pop]=RunAlgorithm(objfun,popSize,nobj,posDim,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w)
[pop,NC,classes]= initialization(popSize,posDim,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
for i=1:popSize
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
% classes=[];
% for i=1:numel(pop)
%     classes(i)=length(pop(i).pos);
% end
% NC=length(unique(classes));
% classes= unique(classes);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AM=[];
    for i=1:numel(pop)
AM=[AM ; pop(i).cost];
    end
    AM=AM';
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for j=1:NC
     str= ['AMC' num2str(j)]
     eval([str '=[]']);
 end
 
 for j=1:NC
      str=['AMC' num2str(j)]
    for i=1:numel(pop)
        if length(pop(i).pos)==classes(j)
            eval([str '=[eval(str) transpose(pop(i).cost)]']);
        end
    end
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 for j=1:NC
      str1=['AMC' num2str(j)]
       str2=['ind' num2str(j)];
       str3=['min' num2str(j)];
       s=['[' str3  ']' '=min(transpose(' str1 '),[],1)'];
       eval(s);
 end
 RAM=zeros(nobj,NC);
 for i=1:NC
     RAM(:,i)=eval(['min' num2str(i)])';
 end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    fprintf('iter:%d\n',iter);
    for i=1:popSize
       a=pop(i).pos;
%        if ~ismember(dims,length(a))
%            continue;
%        end

       b=length(Rep(h).pos);
       if ~any(dims==length(a))
           continue;
       end
        while(b~=length(a))
            h=RouletteWheelSelection(P);
             b=length(Rep(h).pos);
        end
%         if b>length(a)
%             pop(i).pos(end+1:b)=0;
%              pop(i).vel(end+1:b)=0;
%               pop(i).pbest(end+1:b)=0;
%         end
        pop(i).vel= w*pop(i).vel+ rand*(pop(i).pbest-pop(i).pos) +rand*(Rep(h).pos-pop(i).pos);
        tmp=  pop(i).pos + pop(i).vel;
%         tmp=pop(i).pos;
        
        tmp(tmp<lowerBound_pos)=lowerBound_pos;
        tmp(tmp>heigherBound_pos)=heigherBound_pos;
        tmp_cost= objfun(tmp); 
        
        if(Dominates(tmp_cost,pop(i).cost))
        pop(i).pos=tmp;
        end

        pop(i).cost=objfun(pop(i).pos);
%         objs=[objs;pop(i).cost];
%         if iter>1
%         C(i)=setcoverage2(objs(i));
%         end
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
    
%     classes=[];
% for i=1:numel(Rep)
%     classes(i)=length(Rep(i).pos);
% end
% NC=length(unique(classes));
% classes= unique(classes);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AM=[];
    for i=1:numel(pop)
AM=[AM ; pop(i).cost];
    end
    AM=AM';
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for j=1:NC
     str= ['AMC' num2str(j)]
     eval([str '=[]']);
 end
 
 for j=1:NC
      str=['AMC' num2str(j)]
    for i=1:numel(pop)
        if length(pop(i).pos)==classes(j)
            eval([str '=[eval(str) transpose(pop(i).cost)]']);
        end
    end
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 for j=1:NC
      str1=['AMC' num2str(j)]
       str2=['ind' num2str(j)];
       str3=['min' num2str(j)];
       s=['[' str3  ']' '=min(transpose(' str1 '),[],1)'];
       eval(s);
 end
 RAM=zeros(nobj,NC);
 for i=1:NC
     RAM(:,i)=eval(['min' num2str(i)])';
 end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
end

