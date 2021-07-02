clc
clear
close all

AddRequiredPaths

objFuncs = {@MMF14,@MMF15,@MMF14_a,@MMF15_a,@MMF15_l,@MMF15_a_l,@MMF16_l1,...
    @MMF16_l2,@MMF16_l3,@FonsecaFleming_objfun,@TP_ZDT1_objfun,@TP_ZDT2_objfun,...
    @TP_ZDT3_objfun,@TP_ZDT6_objfun};
objFunsStrings = {'MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3','FonsecaFleming_objfun','TP_ZDT1_objfun',...
    'TP_ZDT2_objfun','TP_ZDT3_objfun','TP_ZDT6_objfun'};
nobjs = [2 2 2 2 2 3 3 3 3 2*ones(1,6)];
 lowerBound_dims=[2*ones(1,9),1,2,2,2,2,1];
higherBound_dims=[20*ones(1,13),10,10];
for of = 1:14
    nobj=nobjs(of);
    ObjectiveFunction =objFuncs{of}; % eval(['@' objfunList{seed}]);
numberOfObjectives = nobjs(of);

for seed = 1:10
    tic;
    rng(seed);
    scenarioName = ['Scenario-' num2str(seed)];
    path2 =[cd '/../../../results/' objFunsStrings{of} '/NSGA-II/' scenarioName '/'];
%     addpath(path2);
    if ~exist(path2, 'dir')
       mkdir(path2)
    end

    % handle the objective function by its name
    
    lowerDim=lowerBound_dims(of);
    higherDim= higherBound_dims(of);
    numberOfComponents = higherDim;
   
tmp1 = 0;
tmp2 = 1;
if of==10
    tmp1 = -4;
    tmp2 = 4;
end
    lowerBounds = tmp1*ones(1,numberOfComponents);
    upperBounds =  tmp2*ones(1,numberOfComponents);
    
    MainFile;
   t(seed)=toc; 
end
end
