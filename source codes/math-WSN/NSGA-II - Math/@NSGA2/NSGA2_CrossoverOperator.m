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
%     ld=min(parent1.dim,parent2.dim);
    child1.dim=parent1.dim;
    child2.dim=parent2.dim;
%     crsFlag = [rand(1,ld)<fraction zeros(1,nsga2.numberOfComponents-ld)] ;
    crsFlag = [rand(1,nsga2.numberOfComponents)<fraction] ;
    randNum = randn(1,nsga2.numberOfComponents); % Uniformly distribution
    child1.pos = parent1.pos+crsFlag.*randNum.*ratio.*(parent2.pos-parent1.pos);
    child2.pos = parent2.pos-crsFlag.*randNum.*ratio.*(parent2.pos-parent1.pos);
    
    % Rounding
    child1.pos(nsga2.integerComponents) = round(child1.pos(nsga2.integerComponents));
    child2.pos(nsga2.integerComponents) = round(child2.pos(nsga2.integerComponents));
    
    % Bounding limit
    child1.pos = CheckBounds(nsga2,child1.pos);
    child2.pos = CheckBounds(nsga2,child2.pos);
    child1.pos(child1.dim+1:end) = 100;
    child2.pos(child2.dim+1:end) = 100;
    % Replace
    newPopulation(i,:) = child1;
    newPopulation(i+1,:) = child2;
end
end