function newPopulation = NSGA2_MutationOperator(nsga2,newPopulation,env)
% This function represents "Gaussian mutation"
% Note: All of the individuals would do mutation, but only "mutationFraction"
%       of design variables of an individual would changed.
higherBound_dim=length(newPopulation(1).x);
% Mutation options
fraction = nsga2.mutationOption(1); % Mutation fraction of variables of an individual
scale = nsga2.mutationOption(2);    % This paramter should be large enough for interger variables to change from one to another.
shrink = nsga2.mutationOption(3);

for i = 1:nsga2.numberOfSolutions
    
    % Create children
    child = newPopulation(i);
    sc = scale-shrink*scale*nsga2.currentIteration/nsga2.numberOfIterations;
    sc = sc*(nsga2.upperBounds-nsga2.lowerBounds);
    crsFlag = rand(nsga2.numberOfComponents)<fraction & child.x~=-1;
    randNum = randn(nsga2.numberOfComponents); % Normaly distribution
    child.x(crsFlag) = child.x(crsFlag)+sc.*randNum(crsFlag);
    child.y(crsFlag) = child.y(crsFlag)+sc.*randNum(crsFlag);
dim1=child.dim;
    % Bounding limit
%     cov1=computeCov(child,env);
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
%     child.dim=dim1;
%     child.x=newX;
%      child.y=newY;
%      child=checkBoundsSink(child,dim1,env);
%      cov1=computeCov(child,env);
% end
    child.x(child.dim+1:higherBound_dim)=-1;
    child.y(child.dim+1:higherBound_dim)=-1;
    
    child=checkBoundsSink(child,child.dim,env);
    child = CheckBounds(nsga2,child.dim,child);
    
    % Replace
    newPopulation(i) = child;
end