%% path initializing
nobjArr=2*ones(1,10);
currentFolder = pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/../source code']);
%% loading vlmopso results
resvl=load([currentFolder '/../Results/VLMOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
%% loading nsga2 results
n=load([currentFolder '/../Results/NSGA-II/Scenario-' num2str(Scenario) '/Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat']);
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;
%% loading m-mopso results 
res=load([currentFolder '/../Results/m-MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;
%% loading mopso results
reswm=load([currentFolder '/../Results/MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontwm=reswm.paretoFront;
paretoSetwm=reswm.paretoSet;
classeswm=reswm.classes;
NCwm=reswm.NC;
popwm=reswm.pop;
