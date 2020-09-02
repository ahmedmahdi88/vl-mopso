%% path initializing
nobjArr=nobjs(problemNumber)*ones(1,10);
currentFolder = pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/source codes']);
%% loading vlmopso results
resvl=load([currentFolder '/results/' problems{problemNumber} '/VLMOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
%% loading nsga2 results
n=load([currentFolder '/results/' problems{problemNumber} '/NSGA-II/Scenario-' num2str(Scenario) '/Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat']);
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;
%% loading m-mopso results 
res=load([currentFolder '/results/' problems{problemNumber} '/m-MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;
%% loading mopso results
reswm=load([currentFolder '/results/' problems{problemNumber} '/MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontwm=reswm.paretoFront;
paretoSetwm=reswm.paretoSet;
classeswm=reswm.classes;
NCwm=reswm.NC;
popwm=reswm.pop;
