% Run Algorithm
integerComponents = false(1,numberOfComponents);
numberOfSolutions = 500;
nobj=nobjArr(seed);
numberOfObjectives = 2;
numberOfIterations = 200;

fraction = 0.5;%2/numberOfComponents;
crossoverOption = [fraction 1.2];    % Crossover option [fraction,ratio]  "Intermediate crossover"
mutationOption = [fraction 0.1 0.5]; % Mutation option [fraction,scale,shrink] "Gaussian mutation"

nsga2 = NSGA2(numberOfComponents,integerComponents,numberOfSolutions,numberOfObjectives, ...
    numberOfIterations,lowerBounds,upperBounds,crossoverOption,mutationOption);
[paretoFront t] = RunAlgorithm(nsga2,ObjectiveFunction,lowerDim,higherDim,seed);

save ([path2 scenarioName '_Benchmarck-NSGA-II'],'seed','ObjectiveFunction','paretoFront',.....
    'lowerBounds','upperBounds','t','higherDim')
