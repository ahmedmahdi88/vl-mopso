function [moga,A,a,b,m] = GenerateInitialPopulation(moga,lowerDim,higherDim)
% Uniform generation

for i = 1:moga.numberOfSolutions
     numberOfSensors=round(unifrnd(lowerDim,higherDim));
    [sensorsPos,A,a,b,m]=initializeCOV(numberOfSensors);
    % Create new individual
     individual.dim=numberOfSensors;
    individual.pos = sensorsPos;
    individual.pos(numberOfSensors+1:higherDim) = 0;
    
  
    
    % Rounding
    individual.pos(moga.integerComponents) = round(individual.pos(moga.integerComponents));
    
    % Bounding limit
    individual.pos(1:individual.dim) = CheckBounds(moga,individual.pos(1:individual.dim));
    
    % Add to population
    moga.solutions(i,:) = individual;
end