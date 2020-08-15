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
function [cccc,countIsFixed,pop,env,enhancement_timeout,paretoFront,paretoSet ,NC, classes]=RunAlgorithm(RepSize,nGrid,alpha,nSensors,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w)
% population initialization
[pop,NC,classes,env]= initializationSink(nSensors,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
% calculate porticles cost
for i=1:popSize
 pop(i).cost= objfun(pop(i).pos,env);
end
pop=DetermineDomination(pop);
Rep=[];
% create repository
for i=1:popSize
    if ~pop(i).IsDominated
        if length(Rep)== RepSize
            Rep= deleteFromRep(uniq,Rep);   
        else
            Rep= [Rep pop(i)];
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%

% initialize AMC Matrices
for j=1:NC
    str= ['AMC' num2str(classes(j))];
    eval([str '=[]']);
end

for j=1:NC
    str=['AMC' num2str(classes(j))];
    tmp=eval(str);
    for i=1:numel(pop)
        if length(pop(i).pos.x)==(classes(j))
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
enhancement_timeout=3;
countIsFixed=0;
hhhh = waitbar(1,'hello');
cccc=0;
for iter=1:numberOfIter
    tic
    clc
    prog=['Senario: ' num2str(scenario) ' from 10 scenarios | '  'iter:' num2str(iter) ' progress: ' num2str(ceil(100-(numberOfIter-iter)/numberOfIter*100)) '%'];
    waitbar(1-((numberOfIter-iter)/numberOfIter),hhhh,prog)
    %**************************************************************
 pop=DetermineDomination(pop);
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
    Grid=CreateGrid(Rep,nGrid,alpha);

for i=1:numel(Rep)
    Rep(i)=FindGridIndex(Rep(i),Grid);
end
gi=zeros(1,numel(Rep));
for i=1:numel(Rep)
    gi(i)=Rep(i).GridIndex;
end
uniq=(unique(gi));
     while numel(Rep)>RepSize
        Rep=deleteFromRep(uniq,Rep);
     end
%*************************************************************
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
            [ind1,ind2]= Reconciliation(tmpAMC(i).pbest,tmpAMC(i).pos);
            [ind3,ind4]= Reconciliation(tmpAMC(h).pos,tmpAMC(i).pos);
%             tmpAMC(i).vel.x=zeros(size(tmpAMC(i).vel.x));
%             tmpAMC(i).vel.y=zeros(size(tmpAMC(i).vel.x));
            tmpAMC(i).vel.x(ind2)= w*tmpAMC(i).vel.x(ind2)+ rand*(tmpAMC(i).pbest.x(ind1)-tmpAMC(i).pos.x(ind2)) ;
            tmpAMC(i).vel.y(ind2)= w*tmpAMC(i).vel.y(ind2)+ rand*(tmpAMC(i).pbest.y(ind1)-tmpAMC(i).pos.y(ind2)) ;
            tmp=[];
            tmp.x(ind2) = (tmpAMC(i).pos.x(ind2) + tmpAMC(i).vel.x(ind2));
            tmp.y(ind2) = (tmpAMC(i).pos.y(ind2) + tmpAMC(i).vel.y(ind2));
            tmpAMC(i).vel.x(ind4) = tmpAMC(i).vel.x(ind4)+rand*(tmpAMC(h).pos.x(ind3)-tmpAMC(i).pos.x(ind4));
            tmpAMC(i).vel.y(ind4) = tmpAMC(i).vel.y(ind4)+rand*(tmpAMC(h).pos.y(ind3)-tmpAMC(i).pos.y(ind4));
            tmp.x(ind4) = (tmpAMC(i).pos.x(ind4) + tmpAMC(i).vel.x(ind4));
            tmp.y(ind4) = (tmpAMC(i).pos.y(ind4) + tmpAMC(i).vel.y(ind4));
            
            xSensors=zeros(1,length(env.sensors));
            ySensors=xSensors;
            for s=1:length(xSensors)
                xSensors(s)= env.sensors(s).x;
                ySensors(s)=env.sensors(s).y;
            end
            sensorPos.x=xSensors;
            sensorPos.y=ySensors;
            covThreshold=0.8;
            DistThreShold=3;
            AddedSensorsThreshold= ceil(nSensors/length(tmp.x));
            cov=computeCov(tmp,env);
            if cov<covThreshold
                tmpAMC(i).pos=tmpAMC(i).pos;
                cccc=cccc+1;
%             [tmp isFixed]= RVP_CheckConstraints(tmp,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,heigherBound_pos)
%             countIsFixed=countIsFixed+isFixed;
            else
            tmp_cost= objfun(tmp,env);
            
            if(Dominates(tmp_cost,tmpAMC(i).cost))
                tmpAMC(i).pos=tmp; % update particle position
            else
                % count number of non enhancement times for the particle
                tmpAMC(i).cont= tmpAMC(i).cont+1;
            end
            end
            
            tmpAMC(i).cost=objfun(tmpAMC(i).pos,env); % update particle cost
            
            if Dominates( tmpAMC(i).cost, objfun(tmpAMC(i).pbest,env))
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
        for i=1:length(tmp1)
            if tmp1(i).cont>enhancement_timeout && length(tmp1)>5 % if the particle isn't improved within...
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
                
                
                newClassTemp.pos.x(classes(j)+1:classes(newClass))=unifrnd(0,19.9,1,classes(newClass)-classes(j));
                newClassTemp.pos.y(classes(j)+1:classes(newClass))=unifrnd(0,19.9,1,classes(newClass)-classes(j));
%                 [newClassTemp.pos isf]=RVP_CheckConstraints( newClassTemp.pos,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,heigherBound_pos)
%                 IsFixed=IsFixed+isf;
                newClassTemp.vel.x(classes(j)+1:classes(newClass))=0;
                newClassTemp.vel.y(classes(j)+1:classes(newClass))=0;
                newClassTemp.pbest=newClassTemp.pos;
                %                newClassTemp.pbest.y(classes(j)+1:classes(newClass))=newClassTemp.pos.y(classes(j)+1:classes(newClass));
                newClassTemp.cost=objfun(newClassTemp.pos,env);
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
% paretoSet=[];
cSet=0;
%**************************************************************
 pop=DetermineDomination(pop);
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
    for i=1:numel(Rep)
        paretoFront=[paretoFront;Rep(i).cost];
        paretoSet{i}={Rep(i).pos};
    end

close(hhhh) ;
t=toc;
end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



