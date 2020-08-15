function newPopulation = NSGA2_MutationOperator(nsga2,newPopulation)
% This function represents "Gaussian mutation"
% Note: All of the individuals would do mutation, but only "mutationFraction"
%       of design variables of an individual would changed.

% Mutation options
fraction = nsga2.mutationOption(1); % Mutation fraction of variables of an individual
scale = nsga2.mutationOption(2);    % This paramter should be large enough for interger variables to change from one to another.
shrink = nsga2.mutationOption(3);

for i = 1:nsga2.numberOfSolutions
    
    % Create children
    child = newPopulation(i,:);
    sc = scale-shrink*scale*nsga2.currentIteration/nsga2.numberOfIterations;
    sc = sc*(nsga2.upperBounds-nsga2.lowerBounds);
    sc=ones(1,nsga2.numberOfComponents)*sc;
    crsFlag = rand(1,nsga2.numberOfComponents)<fraction & child.pos~=0;
    randNum = randn(1,length(crsFlag)); % Normaly distribution
    child.pos(crsFlag) = child.pos(crsFlag)+sc(crsFlag).*randNum(crsFlag);
    
    % Rounding
    child.pos(nsga2.integerComponents) = round(child.pos(nsga2.integerComponents));
    
    % Bounding limit
    child.pos(1:child.dim) = CheckBounds(nsga2,child.pos(1:child.dim));
    child.pos(1:child.dim)=checkBoundsSensor(child.pos(1:child.dim));
    % Replace
    newPopulation(i,:) = child;
end