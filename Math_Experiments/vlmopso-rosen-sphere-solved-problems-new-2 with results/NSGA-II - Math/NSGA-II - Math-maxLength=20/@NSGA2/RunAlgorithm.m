function [paretoFront t] = RunAlgorithm(nsga2,ObjectiveFunction,lowerDim,higherDim,scenario)
tic;
% Generate initial population
nsga2 = GenerateInitialPopulation(nsga2,lowerDim,higherDim);

% Evaluate initial population
for i = 1:nsga2.numberOfSolutions
    nsga2.solutionsObjectiveValues(i,:) = ObjectiveFunction(nsga2.solutions(i,:).pos(1:nsga2.solutions(i,:).dim));
end

% Do fast non-dominated sort
nsga2 = FastNonDominatedSort(nsga2);

% Iteration Loop
for iter = 1:nsga2.numberOfIterations
    prog=round(iter/nsga2.numberOfIterations)*100;
    % Update current iteration
    nsga2.currentIteration = iter;
    clc
    % Display the number of generation
    disp(['scenario: ' num2str(scenario) ' from 10 scenarios' ' Iteration: ' num2str(nsga2.currentIteration) ' | progress: ' num2str(prog) ' %']);
    
    % Apply selection operator
    newPopulation = NSGA2_SelectionOperator(nsga2);
    
    % Apply crossover operator
    newPopulation = NSGA2_CrossoverOperator(nsga2,newPopulation);
    
    % Apply mutation operator
    newPopulation = NSGA2_MutationOperator(nsga2,newPopulation);
    
    % Evaluate new population
    newSolsObjectiveValues = zeros(nsga2.numberOfSolutions,nsga2.numberOfObjectives);
    for i = 1:nsga2.numberOfSolutions
        newSolsObjectiveValues(i,:) = ObjectiveFunction(newPopulation(i,:).pos(1:newPopulation(i,:).dim));
    end
    
    % Combine the new population and old population
    nsga2.numberOfSolutions = nsga2.numberOfSolutions*2;
    nsga2.solutions = [nsga2.solutions ; newPopulation];
    nsga2.solutionsObjectiveValues = [nsga2.solutionsObjectiveValues ; newSolsObjectiveValues];
    
    % Do fast non-dominated sort
    nsga2 = FastNonDominatedSort(nsga2);
    
    % Extract the next population
    nsga2 = ExtractNextPopulation(nsga2);
    
    % Plot the extracted generation
   % PlotRankedParetoFronts(nsga2);
end

% Return pareto front with rank 1
indices = nsga2.solutionsRank==1;
paretoFront.solutions = nsga2.solutions(indices);
paretoFront.solutionsObjectiveValues = nsga2.solutionsObjectiveValues(indices,:);
t=toc;
end