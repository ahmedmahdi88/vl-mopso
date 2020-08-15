function newPopulation = NSGA2_CrossoverOperator(nsga2,newPopulation)
% This function represents "Intermediate Crossover Operator"
% Note: All of the individuals would be do crossover, but only "crossoverFraction"
%       of design variables of an individual would changed.

% Crossover option
fraction = nsga2.crossoverOption(1);
ratio = nsga2.crossoverOption(2);

for i = 1:2:nsga2.numberOfSolutions    % Population size should be even number
    
    % Create children
    parent1 = newPopulation(i,:);
    parent2 = newPopulation(i+1,:);
    crsFlag = rand(1,nsga2.numberOfComponents)<fraction & parent1.pos~=0 & parent2.pos~=0;
    randNum = rand(1,nsga2.numberOfComponents); % Uniformly distribution
    child1=parent1;
    child2=parent2;
    child1.pos = parent1.pos+crsFlag.*randNum.*ratio.*(parent2.pos-parent1.pos);
    child2.pos = parent2.pos-crsFlag.*randNum.*ratio.*(parent2.pos-parent1.pos);
    
    % Rounding
%     child1(nsga2.integerComponents) = round(child1(nsga2.integerComponents));
%     child2(nsga2.integerComponents) = round(child2(nsga2.integerComponents));
    
    % Bounding limit
    child1.pos(1:child1.dim) = CheckBounds(nsga2,child1.pos(1:child1.dim));
    child2.pos(1:child2.dim) = CheckBounds(nsga2,child2.pos(1:child2.dim));
    child1.pos(1:child1.dim)=checkBoundsSensor(child1.pos(1:child1.dim));
    child2.pos(1:child2.dim)=checkBoundsSensor(child2.pos(1:child2.dim));
    % Replace
    newPopulation(i,:) = child1;
    newPopulation(i+1,:) = child2;
end
end