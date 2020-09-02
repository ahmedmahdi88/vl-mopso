% Run Algorithm
integerComponents = true(numberOfComponents);
numberOfSolutions = 200;
numberOfObjectives = 2;
numberOfIterations = 100;

fraction = 0.5;
crossoverOption = [fraction 1.2];    % Crossover option [fraction,ratio]  "Intermediate crossover"
mutationOption = [fraction 0.1 0.5]; % Mutation option [fraction,scale,shrink] "Gaussian mutation"

nsga2 = NSGA2(numberOfComponents,integerComponents,numberOfSolutions,numberOfObjectives, ...
    numberOfIterations,lowerBounds,upperBounds,crossoverOption,mutationOption);
[paretoFront env] = RunAlgorithm(nsga2,ObjectiveFunction,lowerBound_dim,higherBound_dim,lowerBound_Pos,higherBound_pos,nSensor);

save ([path2 scenarioName '_NSGA-II'],'seed','ObjectiveFunction','paretoFront',.....
    'lowerBounds','upperBounds','env')
