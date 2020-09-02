clc
clear
close all

AddRequiredPaths
for seed = 1 : 10
    
    rng(seed);
    
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[currentFolder '\Results_sensors\NSGA2\' scenarioName '\'];
    if ~exist(path2, 'dir')
       mkdir(path2)
    end
    addpath(path2);
    
    % handle the objective function by its name
    ObjectiveFunction = @CovCost;
    W=10;H=10;
    A=W*H;
     lowerDim=20;
    higherDim=50;
    numberOfComponents = higherDim;
   
    lowerBounds = 1;%*ones(1,numberOfComponents);
    upperBounds =  100;%*ones(1,numberOfComponents);
    
    MainFile;
    
end
