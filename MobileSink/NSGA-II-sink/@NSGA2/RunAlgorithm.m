function [paretoFront,env] = RunAlgorithm(nsga2,ObjectiveFunction,lowerBound_dim,higherBound_dim,lowerBound_Pos,higherBound_pos,nSensor)

% Generate initial population
[nsga2,env] = GenerateInitialPopulation(nsga2,lowerBound_dim,higherBound_dim,lowerBound_Pos,higherBound_pos,nSensor);

% Evaluate initial population
for i = 1:nsga2.numberOfSolutions
    nsga2.solutionsObjectiveValues(i,:) = ObjectiveFunction(nsga2.solutions(i),env);
end

% Do fast non-dominated sort
nsga2 = FastNonDominatedSort(nsga2);

% Iteration Loop
for iter = 1:nsga2.numberOfIterations
    
    % Update current iteration
    nsga2.currentIteration = iter;
    clc
    % Display the number of generation
    disp(['Iteration: ' num2str(nsga2.currentIteration)]);
    
    % Apply selection operator
    newPopulation = NSGA2_SelectionOperator(nsga2);
    
    % Apply crossover operator
    newPopulation = NSGA2_CrossoverOperator(nsga2,newPopulation,env);
    
    % Apply mutation operator
    newPopulation = NSGA2_MutationOperator(nsga2,newPopulation,env);
    
    % Evaluate new population
    newSolsObjectiveValues = zeros(nsga2.numberOfSolutions,nsga2.numberOfObjectives);
    for i = 1:nsga2.numberOfSolutions
        cov=computeCov(newPopulation(i),env);
        if cov<0.8
            newSolsObjectiveValues(i,:)=inf;
        else
        newSolsObjectiveValues(i,:) = ObjectiveFunction(newPopulation(i),env);
        end
    end
    
    % Combine the new population and old population
    nsga2.numberOfSolutions = nsga2.numberOfSolutions*2;
    nsga2.solutions = [nsga2.solutions , newPopulation];
    nsga2.solutionsObjectiveValues = [nsga2.solutionsObjectiveValues ; newSolsObjectiveValues];
%     s(1:nsga2.numberOfSolutions,:,iter)=nsga2.solutionsObjectiveValues;
%     if iter>1
%         C(iter-1)=SetCoverage2( s(1:nsga2.numberOfSolutions,:,iter), s(1:nsga2.numberOfSolutions,:,iter-1))
%     end
    % Do fast non-dominated sort
    nsga2 = FastNonDominatedSort(nsga2);
    
    % Extract the next population
    nsga2 = ExtractNextPopulation(nsga2);
    
    % Plot the extracted generation
%    PlotRankedParetoFronts(nsga2);
end

% Return pareto front with rank 1
indices = nsga2.solutionsRank==1;
paretoFront.solutions = nsga2.solutions(indices);
paretoFront.solutionsObjectiveValues = nsga2.solutionsObjectiveValues(indices,:);
% figure(2)
% plot(C,'linewidth',2)
% title('NSGA II SetCoverage(nextGen,prevGen');
end