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
%     crsFlag = rand(1,child.dim)<fraction;
    crsFlag = rand(1,length(child))<fraction;
    randNum = randn(1,length(child)); % Normaly distribution
    child.pos(crsFlag) = child.pos(crsFlag)+sc(crsFlag).*randNum(crsFlag);
    
    % Rounding
    child.pos(nsga2.integerComponents) = round(child.pos(nsga2.integerComponents));
    
    % Bounding limit
    child.pos = CheckBounds(nsga2,child.pos);
    child.pos(child.dim+1:end) = 100;
    % Replace
    newPopulation(i,:) = child;
end