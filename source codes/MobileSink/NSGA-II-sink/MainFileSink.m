clc
clear
close all

AddRequiredPaths
for seed = 1 : 10  
    rng(seed); 
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[currentFolder 'Results_Sink\NSGA II\' scenarioName '\'];
    if ~exist(path2, 'dir')
       mkdir(path2)
    end
    
    % handle the objective function by its name
    ObjectiveFunction = @MobileSinkObjFun;
    higherBound_dim=25;
    lowerBound_dim=5;
    lowerBound_Pos=0;
    higherBound_pos=19.9;
    numberOfComponents =[1,higherBound_dim];
    lowerBounds = 0;
    upperBounds = 19.9;
    nSensor=10;


    MainFile;
    
end
