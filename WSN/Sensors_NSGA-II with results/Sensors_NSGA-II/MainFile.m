% Run Algorithm
integerComponents = true(1,numberOfComponents);
numberOfSolutions = 150;
numberOfObjectives = 2;
numberOfIterations = 100;

fraction = 0.5;%2/numberOfComponents;
crossoverOption = [fraction 1.2];    % Crossover option [fraction,ratio]  "Intermediate crossover"
mutationOption = [fraction 0.1 0.5]; % Mutation option [fraction,scale,shrink] "Gaussian mutation"

nsga2 = NSGA2(numberOfComponents,integerComponents,numberOfSolutions,numberOfObjectives, ...
    numberOfIterations,lowerBounds,upperBounds,crossoverOption,mutationOption);
[t,paretoFront] = RunAlgorithm(nsga2,ObjectiveFunction,lowerDim,higherDim,seed);

save ([path2 scenarioName ],'seed','ObjectiveFunction','paretoFront',.....
    'lowerBounds','upperBounds','t')
