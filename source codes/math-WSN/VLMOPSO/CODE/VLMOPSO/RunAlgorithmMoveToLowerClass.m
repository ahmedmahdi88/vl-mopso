function [pop,t,population,maxEnhancementTimeOut,paretoFront,paretoSet ,NC, classes,v]=...
    RunAlgorithm(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,...
    lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,...
    numberOfIter,w,p_mutation,mutatedRatio,Vmin,Vmax,scale,shrink)
tic
w0 = w;
p_mutation0 = p_mutation;
population=0;
%% initialization
[pop,NC,classes]= initialization(popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim);
%% evaluation
for i=1:popSize
    %     pop(i).cost= objfun(pop(i).pos,A,b,a,m);
    pop(i).cost= objfun(pop(i).pos);
end
%% determine non dominated solutions
pop=DetermineDomination(pop);
Rep=[];
%% starting main sc-mopso algorithm
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% setting some temporary parameters
% enhancement_timeout=round(unifrnd(20,50));
% enhancement_timeout=5 ;
maxEnhancementTimeOut=19;%round(numberOfIter/10);
hhhh = waitbar(1,'hello');
caa=0;
%% start iterations
for iter=1:numberOfIter
    deletedClasses=[];
    clc
    prog=['Senario: ' num2str(scenario) ' from 10 scenarios | '  'iter:' num2str(iter) ' progress: ' num2str(ceil(100-(numberOfIter-iter)/numberOfIter*100)) '%'];
    
    waitbar(1-((numberOfIter-iter)/numberOfIter),hhhh,prog)
    % disp(['iter=' num2str(iter)])
    halfItersNum = numberOfIter/2;
    x = iter + 1 - halfItersNum;
    a = 1/(halfItersNum^2);
    sc = scale;
    % sc = scale-shrink*scale*iter/numberOfIter;
    p_mutation = p_mutation0*(-a*x^2 + 1);
    % w =  w0*(-a*x^2 + 1);
    
    %**************************************************************
    %% determine nonDominated sols
    pop=DetermineDomination(pop);
    pareto= pop(~[pop.IsDominated]);
    pareto = [pareto.cost];
    pareto = reshape(pareto,2,length(pareto)/2);
    pareto = pareto';
    plot(pareto(:,1),pareto(:,2),'bo');drawnow;
    %% update the repository
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
    %% update AMC matrices
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
        %%
        f=round(unifrnd(1,nobj)); % determine random objective
        %% create pdf for each AMC
        if all(costs(f,:)==0)     % if all objectives values =0 then the selection
            % probability is the same for all
            pdfpf=ones(size(costs(f,:)))/length(costs(f,:));
        else
            pdfpf=exp(costs(f,:)./(sum(costs(f,:)))); % calculate pdf
        end
        pdfpf(pdfpf<0)=1+ pdfpf(pdfpf<0);
        h=RouletteWheelSelectionMin((pdfpf)); % select random exampler
        %   h=fortune_wheel(1./pdfpf);
        disp(['h=' num2str(h)]);
        if isempty(h) || h==-1
            h=randi(length(pdfpf));
        end
        %      figure
        %      plot(pdfpf);
        %% Movement
        for i=1:length(tmpAMC)
            % update the velocity for each particle in the class
            ln = length(tmpAMC(i).vel);
            tmpAMC(i).vel= w*tmpAMC(i).vel+ 2*rand(1,ln).*(tmpAMC(i).pbest-tmpAMC(i).pos) + 2*rand(1,ln).*(tmpAMC(h).pos-tmpAMC(i).pos);
            tmpAMC(i).vel(tmpAMC(i).vel<Vmin) = Vmin;
            tmpAMC(i).vel(tmpAMC(i).vel>Vmax) = Vmax;
            tmp=  (tmpAMC(i).pos + tmpAMC(i).vel);
            tmp(tmp<lowerBound_pos)=lowerBound_pos;
            tmp(tmp>heigherBound_pos)=heigherBound_pos;
            if rand<p_mutation
                tmp = mutationPso(tmp,mutatedRatio,lowerBound_pos,heigherBound_pos,sc);
                tmp(tmp<lowerBound_pos)=lowerBound_pos;
                tmp(tmp>heigherBound_pos)=heigherBound_pos;
            end
            %         tmp=checkBounds(tmp);
            
            %         tmp_cost= objfun(tmp,A,b,a,m);
            tmp_cost= objfun(tmp);
            
            if(Dominates(tmp_cost,tmpAMC(i).cost))
                tmpAMC(i).pos=tmp; % update particle position
                %         caa=caa+1;
            else
                % count number of non enhancement times for the particle
                tmpAMC(i).cont= tmpAMC(i).cont+1;
                %            caa=caa+1;
            end
            %% rest nonEnhancementCounter
            if rem(iter,maxEnhancementTimeOut+1)==0
                tmpAMC(i).cont=0;
                %            caa=0;
            end
            %%
            %         tmpAMC(i).cost=objfun(tmpAMC(i).pos,A,b,a,m); % update particle cost
            tmpAMC(i).cost=objfun(tmpAMC(i).pos);
            %         if Dominates( tmpAMC(i).cost, objfun(tmpAMC(i).pbest,A,b,a,m))
            if Dominates( tmpAMC(i).cost, objfun(tmpAMC(i).pbest))
                tmpAMC(i).pbest= tmpAMC(i).pos; %update particle pbest
            end
        end
        eval([str '=tmpAMC' ]); %update AMC matrix for the current class
    end
    %% update particles lengths
    for j=1:NC
        if NC==1
            index=[];
            break;
            
        end
        index=[];
        str1=['AMC' num2str(classes(j))];
        tmp1= eval(str1);
        Cont=[];
        for ii=1:length(tmp1)
            Cont=[Cont tmp1(ii).cont];
        end
        med=median(Cont);
        %        maxEnhancementTimeOut=19;
        enhancement_timeout=maxEnhancementTimeOut*((maxEnhancementTimeOut-...
            med)/maxEnhancementTimeOut);
        for i=1:length(tmp1)
            if tmp1(i).cont>enhancement_timeout && length(tmp1)>8 % if the particle isn't improved within...
                %10 iterations
                tmp1(i).cont=0;
                newClassTemp=tmp1(i);
                cf=round(unifrnd(1,nobj)); % random objective
                if all(RAM(cf,:)==0) % if all RAM objectives ==0 then select...
                    % with the same probability
                    pdfcf=ones(size( RAM(cf,:)))/length(RAM(cf,:));
                else
                    pdfcf=RAM(cf,:);
                    pdfcf=exp(RAM(cf,:)./sum(RAM(cf,:)));% pdf
                    pdfcf(pdfcf<0)=1+pdfcf(pdfcf<0);
                end
                %                newClass=normpdf(pdfcf);
                newClass=RouletteWheelSelectionMin(pdfcf);
                % newClass=fortune_wheel(1./pdfcf);
                if isempty(newClass)
                    continue;
                end
                if(newClass==j)
                    continue;
                end
                index=[index i];% put moved particle index in the "index" array
                
                
                str=['AMC' num2str(classes(newClass))];
                tmpNewACM=eval(str);
                % zero padding when move to higher class
                if classes(newClass)>classes(j)
                    newClassTemp.pos(classes(j)+1:classes(newClass))=round(unifrnd(lowerBound_pos,heigherBound_pos,1,length(classes(j)+1:classes(newClass))));
                    %                newClassTemp.pos=checkBounds(newClassTemp.pos);
                    newClassTemp.pos=realcheckBounds(newClassTemp.pos,lowerBound_pos,heigherBound_pos);
                    newClassTemp.vel(classes(j)+1:classes(newClass))=0;
                    newClassTemp.pbest(classes(j)+1:classes(newClass))=newClassTemp.pos(classes(j)+1:classes(newClass));
                elseif classes(newClass)<classes(j)
                    newClassTemp.pos(classes(newClass)+1:classes(j))=[];
                    newClassTemp.pos=realcheckBounds(newClassTemp.pos,lowerBound_pos,heigherBound_pos);
                    newClassTemp.vel(classes(newClass)+1:classes(j))=[];
                    newClassTemp.pbest(classes(newClass)+1:classes(j))=[];
                end
                %                newClassTemp.cost=objfun(newClassTemp.pos,A,b,a,m);
                newClassTemp.cost=objfun(newClassTemp.pos);
                % update the AMC for the new class
                tmpNewACM=[tmpNewACM newClassTemp];
                eval([str '=tmpNewACM']);
                
            end
        end
        
        tmp1(index)=[];
        eval([str1 '=tmp1']);% delete moved particles from AMC
        %        if isempty(tmp1Val)
        %          deletedClasses=[deletedClasses j];
        %      end
    end
    ic=[]  ;
    %% delete moved particles from the class
    for j=1:NC
        str1=['AMC' num2str(classes(j))];
        tmp1= eval(str1);
        if isempty(tmp1)
            ic=[ic j];
            eval(['clear ' str1 ' ']); % delete empty AMCs
        end
    end
    %%
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
    popC=0;
    for i=1:NC
        str1=['AMC' num2str(classes(i))];
        v=eval(str1);  % all particles objectives
        for j=1:length(v)
            popC=popC+1;
            pop(popC)=v(j);
        end
    end
    %  w = w*0.99;
    % p_mutation = p_mutation*0.99;
end % end iterations
%% find pareto front and particles objectives values
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



