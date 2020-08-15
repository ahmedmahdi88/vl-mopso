%RunAlgorithm: for running VL MO PSO algorithm
% outputs:
% pareto: pareto front
% NC: number of classes
% classes: variables lengths
% v: all population cost values
% inputs:
% objfun: objective function
% popsize: population size
% nobj: number of objectives
% lowerBound_pos: lower position value
% higherBound_pos: higher position value
% lowerBound_dim: lower position length
% higherBound_dim: higher position length
% numberOfIter: number of iterations
% w: inertia weight
function [t,population,enhancement_timeout,paretoFront,paretoSet ,NC, classes,v]=RunAlgorithm(scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,minNumOfParticles)
% population initialization
tic
[pop,NC,classes,A,a,b,m]= initializationSensors(popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
% calculate porticles cost
for i=1:popSize
    pop(i).cost= objfun(pop(i).pos,A,b,a,m);
end 
% Detrrmine Dominated particles
pop=DetermineDomination(pop);
% initialize AMC Matrices
 for j=1:NC
     str= ['AMC' num2str(classes(j))];
     eval([str '=[]']);
 end
 
 for j=1:NC
      str=['AMC' num2str(classes(j))];
      tmp=eval(str);
    for i=1:numel(pop)
        if length(pop(i).pos)==(classes(j))
           tmp=[tmp pop(i)]; 
        end
    end
    eval([str '=tmp']);
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialize RAM matrix
 for j=1:NC
       str1=['AMC' num2str(classes(j))];
       tmp1= eval(str1);
       costs=[];
       for i=1:numel(tmp1)
       costs=[costs; tmp1(i).cost];
       end
       str2=['ind' num2str(classes(j))];
       str3=['min' num2str(classes(j))];
       s=['[' str3  ']' '=min(transpose(costs),[],2)'];
       eval(s);
 end
 RAM=zeros(nobj,NC);
 for i=1:NC
     RAM(:,i)=eval(['min' num2str(classes(i))]);
 end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % start iterations ..................................................
% enhancement_timeout=round(unifrnd(20,50));

hhhh = waitbar(1,'hello');
for iter=1:numberOfIter
    clc
prog=['Senario: ' num2str(scenario) ' from 10 scenarios | '  'iter:' num2str(iter) ' progress: ' num2str(ceil(100-(numberOfIter-iter)/numberOfIter*100)) '%'];
waitbar(1-((numberOfIter-iter)/numberOfIter),hhhh,prog)
maxEnhancementTimeout=numberOfIter/20;
windowTime=20;
% disp(['iter=' num2str(iter)])
for c=1:NC
     str = ['AMC' num2str(classes(c))];
     tmpAMC=eval(str);
     costs=[];
       for i=1:numel(tmpAMC)
       costs=[costs; tmpAMC(i).cost];
       end
       costs=costs';
       if(isempty(costs)) % if AMS is empty then continue
           continue; 
       end
       
     f=round(unifrnd(1,nobj)); % determine random objective
     if all(costs(f,:)==0)     % if all objectives values =0 then the selection 
         % probability is the same for all 
         pdfpf=ones(size(costs(f,:)))/length(costs(f,:));
     else
         pdfpf=costs(f,:)/sum(costs(f,:)); % calculate pdf
     end
     h=RouletteWheelSelectionMin((pdfpf)); % select random exampler
     disp(['h=' num2str(h)]);
     if isempty(h)
         h=1;
     end
%      figure 
%      plot(pdfpf);
    for i=1:length(tmpAMC)
         % update the velocity for each particle in the class
        tmpAMC(i).vel= w*tmpAMC(i).vel+ rand*(tmpAMC(i).pbest-tmpAMC(i).pos) +rand*(tmpAMC(h).pos-tmpAMC(i).pos);
       
        tmp=  round(tmpAMC(i).pos + tmpAMC(i).vel); 
       tmp(tmp<lowerBound_pos)=lowerBound_pos;
        tmp(tmp>heigherBound_pos)=heigherBound_pos;
        tmp=checkBounds(tmp);
        
        tmp_cost= objfun(tmp,A,b,a,m); 
%         if mod(iter,windowTime)==0
%              tmpAMC(i).cont=0;
%         end
        if(Dominates(tmp_cost,tmpAMC(i).cost))
        tmpAMC(i).pos=tmp; % update particle position
        else
            % count number of non enhancement times for the particle
           tmpAMC(i).cont= tmpAMC(i).cont+1; 
        end

        tmpAMC(i).cost=objfun(tmpAMC(i).pos,A,b,a,m); % update particle cost

        if Dominates( tmpAMC(i).cost, objfun(tmpAMC(i).pbest,A,b,a,m))
            tmpAMC(i).pbest= tmpAMC(i).pos; %update particle pbest
        end
    end
  eval([str '=tmpAMC' ]); %update AMC matrix for the current class
end

% update particles lengths
 for j=1:NC
     if NC==1
          index=[];
         break;
         
     end
      index=[];
       str1=['AMC' num2str(classes(j))];
       tmp1= eval(str1);
       ncc=[];
       for i=1:length(tmp1)
           ncc=[ncc tmp1.cont];
       end
       med=median(ncc);
       enhancement_timeout=maxEnhancementTimeout*((maxEnhancementTimeout-med)/maxEnhancementTimeout);
       for i=1:length(tmp1)
           if tmp1(i).cont>5 && length(tmp1)>minNumOfParticles % if the particle isn't improved within... 
                                  %enhancement_timeout
               tmp1(i).cont=0;
               newClassTemp=tmp1(i);
               cf=round(unifrnd(1,nobj)); % random objective
               if all(RAM(cf,:)==0) % if all RAM objectives ==0 then select...
                                       % with the same probability
                  pdfcf=ones(size( RAM(cf,:)))/length(RAM(cf,:));
               else
               pdfcf=RAM(cf,:)/sum(RAM(cf,:));% pdf
               end
               newClass=RouletteWheelSelectionMin(pdfcf);
               co=0;
               flag=0;
               CFlag=0;
               while newClass<=j  % ensure that the particle will not move...
                   % to the same class or to a lower length class
                   newClass=RouletteWheelSelectionMin(pdfcf);
                  if NC==1
                      CFlag=1;
                      break;
                  end
                   if isempty(newClass) 
                       flag=1;
                       break; 
                   end
                   co=co+1;
                   if co>50 % if we can't find new class
                       % leave the class in the same class
                       flag=1;
                       break;
                   end
               end
               if flag
                   continue;
               end
               if CFlag
                   break;
               end
                if isempty(newClass)
                    continue;
                end
                index=[index i];% put moved particle index in the "index" array
            
               
               str=['AMC' num2str(classes(newClass))];
               tmpNewACM=eval(str);
              % zero padding when move to higher class
               newClassTemp.pos(classes(j)+1:classes(newClass))=round(unifrnd(1,100));
               newClassTemp.pos=...
                   checkBounds(newClassTemp.pos);
               newClassTemp.vel(classes(j)+1:classes(newClass))=0;
               newClassTemp.pbest(classes(j)+1:classes(newClass))=newClassTemp.pos(classes(j)+1:classes(newClass));
               newClassTemp.cost=objfun(newClassTemp.pos,A,b,a,m);
               % update the AMC for the new class
               tmpNewACM=[tmpNewACM newClassTemp];
               eval([str '=tmpNewACM']);
              
           end
       end
      
           tmp1(index)=[];      
       eval([str1 '=tmp1']);% delete moved particles from AMC 
 end
     ic=[]  ; 
for j=1:NC
       str1=['AMC' num2str(classes(j))];
       tmp1= eval(str1);
       if isempty(tmp1)
           ic=[ic j];
         eval(['clear ' str1 ' ']); % delete empty AMCs
       end
end
classes(ic)=[]; % delete empty classes
%update classes and number of classes
 classes= unique(classes); 
  NC= length(unique(classes));
  % update RAM matrix
  for j=1:NC
      str1=['AMC' num2str(classes(j))];
       tmp1= eval(str1);
       costs=[];
       for i=1:numel(tmp1)
       costs=[costs; tmp1(i).cost];
       end
       str2=['ind' num2str(classes(j))];
       str3=['min' num2str(classes(j))];
       s=['[' str3  ']' '=min(transpose(costs),[],2)'];
       eval(s);
  end
 RAM=zeros(nobj,NC);
 for i=1:NC
     RAM(:,i)=eval(['min' num2str(classes(i))]);
 end
 %%%%%%%%%%%%%%%%%%%
 
end % end iterations
% find pareto front and particles objectives values
 classes= unique(classes); 
  NC= length(unique(classes));
paretoFront=[];
cSet=0;
for i=1:NC
    str1=['AMC' num2str(classes(i))];
    v=eval(str1);  % all particles objectives
    for j=1:length(v)
    paretoFront=[paretoFront;v(j).cost];
    cSet=cSet+1;
    paretoSet{cSet}=v(j).pos;
    end
end
tmp=paretoFront;
index_dominated=[];
for i=1:size(paretoFront,1)-1
     for j=2:size(paretoFront,1)
    if Dominates(paretoFront(i,:),paretoFront(j,:))
             paretoFront(j,:)=[inf,inf];
    index_dominated=[index_dominated j];
    elseif Dominates(paretoFront(j,:),paretoFront(i,:))
             paretoFront(i,:)=[inf,inf];
             index_dominated=[index_dominated i];
    end
     end
end
population=paretoSet;
paretoFront(index_dominated,:)=[];
% for ind=1:length(index_dominated)
paretoSet(index_dominated)=[];
% end
close(hhhh) ;
t=toc;
end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



