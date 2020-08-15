clc
clear
close all

AddRequiredPaths
for seed = 1:10
    tic;
    rng(seed);
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[currentFolder '\ResultsMath-Rosen_Griewanks_Rastrigin\'  scenarioName '\'];
    addpath(path2);
    if ~exist(path2, 'dir')
       mkdir(path2)
    end

    % handle the objective function by its name
    ObjectiveFunction =@Rosen_Griewanks_Rastrigin; % eval(['@' objfunList{seed}]);
    lowerDim=1;
    higherDim=20;
    numberOfComponents = higherDim;
    lowerBounds = -600*ones(1,numberOfComponents);
    upperBounds =  600*ones(1,numberOfComponents);
    
    MainFile;
   t(seed)=toc; 
end
