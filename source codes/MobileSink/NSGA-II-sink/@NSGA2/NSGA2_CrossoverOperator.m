function newPopulation = NSGA2_CrossoverOperator(nsga2,newPopulation,env)
% This function represents "Intermediate Crossover Operator"
% Note: All of the individuals would be do crossover, but only "crossoverFraction"
%       of design variables of an individual would changed.
higherBound_dim=length(newPopulation(1).x);
% Crossover option
fraction = nsga2.crossoverOption(1);
ratio = nsga2.crossoverOption(2);

for i = 1:2:nsga2.numberOfSolutions    % Population size should be even number
    
    % Create children
    parent1 = newPopulation(i);
    parent2 = newPopulation(i+1);
    crsFlag = rand(nsga2.numberOfComponents)<fraction & parent1.x~=-1 & parent2.x~=-1;
    randNum = rand(nsga2.numberOfComponents); % Uniformly distribution

child1.dim=parent1.dim;
    child2.dim=parent2.dim;
    child1.x= parent1.x+crsFlag.*randNum.*ratio.*(parent2.x-parent1.x);
    child2.x= parent2.x-crsFlag.*randNum.*ratio.*(parent2.x-parent1.x);
    child1.y= parent1.y+crsFlag.*randNum.*ratio.*(parent2.y-parent1.y);
    child2.y= parent2.y-crsFlag.*randNum.*ratio.*(parent2.y-parent1.y);
    child1.dim=parent1.dim;
    child2.dim=parent2.dim;
    dim1=child1.dim;
    dim2=child2.dim;
     % Rounding
%     child1(nsga2.integerComponents) = round(child1(nsga2.integerComponents));
%     child2(nsga2.integerComponents) = round(child2(nsga2.integerComponents));
%      cov1=computeCov(child1,env);
%      if cov1
% cc=0;
% xSensors=zeros(1,length(env.sensors));
% ySensors=xSensors;
% for s=1:length(xSensors)
%     xSensors(s)= env.sensors(s).x;
%     ySensors(s)=env.sensors(s).y;
% end

%%%%%%%%%%%%%%%%%%%%
% while cov1<0.8
%     cc=cc+1;
%      if cc>50
%          if dim1+1>higherBound_dim
%             dim1= higherBound_dim;
%          else
%          dim1=dim1+1;
%          end
%      end
%          newX=zeros(1,dim1);
%          newY=newX;
%          for nxy=1:length(newX)
%      rndIndx=round(unifrnd(1,length(xSensors)));
%      newX(nxy)=round(unifrnd(xSensors(rndIndx)+0.1,xSensors(rndIndx)+3),1);
%      newY(nxy)=round(unifrnd(ySensors(rndIndx)+0.1,ySensors(rndIndx)+3),1);
%          end
%     child1.dim=dim1;
%     child1.x=newX;
%      child1.y=newY;
%      child1=checkBoundsSink(child1,dim1,env);
%      cov1=computeCov(child1,env);
% end
% child1.x(child1.dim+1:higherBound_dim)=-1;
%     child1.y(child1.dim+1:higherBound_dim)=-1;
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      cov2=computeCov(child2,env);
% cc=0;
% xSensors=zeros(1,length(env.sensors));
% ySensors=xSensors;
% for s=1:length(xSensors)
%     xSensors(s)= env.sensors(s).x;
%     ySensors(s)=env.sensors(s).y;
% end
% %%%%%%%%%%%%%%%%%%%%
% while cov2<0.8
%     cc=cc+1;
%      if cc>50
%          if dim2+1>higherBound_dim
%             dim2= higherBound_dim;
%          else
%          dim2=dim2+1;
%          end
%      end
%          newX=zeros(1,dim2);
%          newY=newX;
%          for nxy=1:length(newX)
%      rndIndx=round(unifrnd(1,length(xSensors)));
%      newX(nxy)=round(unifrnd(xSensors(rndIndx)+0.1,xSensors(rndIndx)+3),1);
%      newY(nxy)=round(unifrnd(ySensors(rndIndx)+0.1,ySensors(rndIndx)+3),1);
%          end
%     child2.dim=dim2;
%     child2.x=newX;
%      child2.y=newY;
%      child2=checkBoundsSink(child2,dim2,env);
%      cov2=computeCov(child2,env);
% end
% child2.x(child2.dim+1:higherBound_dim)=-1;
%     child2.y(child2.dim+1:higherBound_dim)=-1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    % Bounding limit
     child1 = checkBoundsSink(child1,child1.dim,env);
     child2 = checkBoundsSink(child2,child2.dim,env);
    child1 = CheckBounds(nsga2,child1.dim,child1);
    child2 = CheckBounds(nsga2,child2.dim,child2);
   
    % Replace
    newPopulation(i) = child1;
    newPopulation(i+1) = child2;
end
end