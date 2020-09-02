clc
clear
close all

AddRequiredPaths
for seed = 1:10
    tic;
    rng(seed);
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[currentFolder '\ResultsMath-levy_powell_stybtang\'  scenarioName '\'];
    addpath(path2);
    if ~exist(path2, 'dir')
       mkdir(path2)
    end

    % handle the objective function by its name
    ObjectiveFunction =@levy_powell_stybtang; % eval(['@' objfunList{seed}]);
    lowerDim=1;
    higherDim=30;
    numberOfComponents = higherDim;
    lowerBounds = -10*ones(1,numberOfComponents);
    upperBounds =  10*ones(1,numberOfComponents);
    
    MainFile;
   t(seed)=toc; 
end