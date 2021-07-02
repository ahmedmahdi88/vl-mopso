function moga = GenerateInitialPopulation(moga,lowerDim,higherDim)
% Uniform generation

for i = 1:moga.numberOfSolutions
    dim= round(unifrnd(lowerDim,higherDim));
    individual.dim=dim;
    % Create new individual
    individual.pos = unifrnd( moga.lowerBounds(1),moga.upperBounds(1),1,dim);
    individual.pos(dim+1:higherDim)=-1;
%     moga.lowerBounds+rand(1,moga.numberOfComponents).*(moga.upperBounds-moga.lowerBounds);
    
    % Rounding
    individual.pos(moga.integerComponents) = round(individual.pos(moga.integerComponents));
    
    % Bounding limit
    individual.pos = CheckBounds(moga,individual.pos);
    
    % Add to population
    moga.solutions(i,:) = individual;
end