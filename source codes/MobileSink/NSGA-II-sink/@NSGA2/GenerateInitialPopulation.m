function [moga,env] = GenerateInitialPopulation(moga,lowerBound_dim,higherBound_dim,lowerBound_Pos,higherBound_pos,nSensors)
% Uniform generation

% dimensionOfParticle=[2 higherBound_dim];
env=initializeSink(10,nSensors);
for i = 1:moga.numberOfSolutions
    dim=round(unifrnd(lowerBound_dim,higherBound_dim));
    individual.dim=dim;
     for r=1:dim
    env.rndVoz(r).x=unifrnd(lowerBound_Pos,higherBound_pos,1,dim);
    env.rndVoz(r).y=unifrnd(lowerBound_Pos,higherBound_pos,1,dim);
    end
    % Create new individual
   % individual = moga.lowerBounds+rand(1,moga.numberOfComponents).*(moga.upperBounds-moga.lowerBounds);
    individual.x(1:individual.dim) =unifrnd(lowerBound_Pos,higherBound_pos,1,individual.dim);
    individual.y(1:individual.dim)= unifrnd(lowerBound_Pos,higherBound_pos,1,individual.dim);
    % Rounding
  %  individual(moga.integerComponents) = round(individual(moga.integerComponents));
    individual.x(individual.dim+1:higherBound_dim)=-1;
    individual.y(individual.dim+1:higherBound_dim)=-1;
    % Bounding limit
    cov=computeCov(individual,env);
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
         if dim+1>higherBound_dim
            dim= higherBound_dim;
         else
         dim=dim+1;
         end
     end
         newX=zeros(1,dim);
         newY=newX;
         for nxy=1:length(newX)
     rndIndx=round(unifrnd(1,length(xSensors)));
     newX(nxy)=round(unifrnd(xSensors(rndIndx)+0.1,xSensors(rndIndx)+3),1);
     newY(nxy)=round(unifrnd(ySensors(rndIndx)+0.1,ySensors(rndIndx)+3),1);
         end
    individual.dim=dim;
    individual.x=newX;
     individual.y=newY;
     individual=checkBoundsSink(individual,dim,env);
     cov=computeCov(individual,env);
end
individual.x(individual.dim+1:higherBound_dim)=-1;
    individual.y(individual.dim+1:higherBound_dim)=-1;
    individual=checkBoundsSink(individual,dim,env);
    individual = CheckBounds(moga,dim,individual);
    % Add to population
    moga.solutions(i) = individual;
end