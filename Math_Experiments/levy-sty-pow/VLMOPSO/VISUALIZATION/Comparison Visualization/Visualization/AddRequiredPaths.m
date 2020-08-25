
% clear;clc;close all;
% Scenario=1;
cd ..;
cd ..;
cd ..;
objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
nobjArr=3*ones(1,10);
% if you want to visualize mathematical function results uncomment the of the
% two following lines and comment the next line
% nobjArr=[2 2 2 3 2 3 2 3 3 2];
% cd 'Results_fixed_enhancement_time_out'
% cd 'Results_fixed_enhancement_time_out-maxLen=20'
% cd 'Results_fixed_enhancement_time_out-maxLen=20-minclass=5'
% cd 'Results_Sink'
% cd 'Results-maxLen=20-allowTravellingToLowerClass'
cd 'Results_Math_levy_powell_stybtang'
% cd 'Results_Sensors'
currentFolder = pwd;

% select wich scenario you need to visualize
% 
resvl=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
% repvl=resvl.rep;
cd ..
cd ..
%  cd(['ExperimentSmall\' objfunList{Scenario} '\']);
%  n=load(['Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat' ]);
%  cd(['Experiment-ml=20\' objfunList{Scenario} '\']);
%  n=load(['Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat' ]);
% cd(['Results_sensors_NSGA2\NSGA2' '\']);
% n=load(['Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '.mat' ]);
n=load(['NSGA-II - Math\NSGA-II - Math-maxLength=35\ResultsMath-levy_powell_stybtang\Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
% env=resvl.env;
% lowerLengthvl=resvl.lowerBound_dim;
% higherLengthvl=resvl.higherBound_dim;
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;


 
% if you want to visualize mathematical function results uncomment one of the
% following line and comment the next line

cd 'mopso-with-addhock-for-variable-length/Results_Math_levy_powell_stybtang'
% cd 'mopso-with-addhock-for-variable-length/Results'
% cd 'mopso-with-addhock-for-variable-length/Results_Sink'
% cd 'mopso-with-addhock-for-variable-length/Results_Sensors'
% cd 'mopso-with-addhock-for-variable-length/Results_mopso-adhoc-mL=20'
currentFolder = pwd;
% Scenario=2;
res=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;
% pareto=res.pareto;
% lowerLength=res.lowerBound_dim;
% higherLength=res.higherBound_dim;
cd ..
cd Results_Math_levy_powell_stybtang_WithoutMutation
currentFolder = pwd;
reswm=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontwm=reswm.paretoFront;
paretoSetwm=reswm.paretoSet;
classeswm=reswm.classes;
NCwm=reswm.NC;
popwm=reswm.pop;

cd ..;
cd ..;

currentFolder=pwd;
path= [currentFolder '\VLMOPSO\VISUALIZATION\Comparison Visualization\Visualization'];
cd(path);


