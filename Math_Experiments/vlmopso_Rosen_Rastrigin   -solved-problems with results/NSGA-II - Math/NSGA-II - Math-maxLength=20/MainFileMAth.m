clc
clear
close all
objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
nobjArr=[2 2 2 3 2 3 2 3 3 2];

AddRequiredPaths
for seed = 1 :10
    tic;
    rng(seed);
    nobj=nobjArr(seed);
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[currentFolder '\ResultsMath-Rosen_Rastrigin\'  scenarioName '\'];
    addpath(path2);
    if ~exist(path2, 'dir')
       mkdir(path2)
    end

    % handle the objective function by its name
    ObjectiveFunction =@Rosen_Rastrigin; % eval(['@' objfunList{seed}]);
    lowerDim=1;
    higherDim=30;
    numberOfComponents = higherDim;
    lowerBounds = -5.12*ones(1,numberOfComponents);
    upperBounds =  5.12*ones(1,numberOfComponents);
    
    MainFile;
   t(seed)=toc; 
end
