%% path initializing
nobjArr=3*ones(1,10);
currentFolder = pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/../source code']);
%% loading vlmopso results
resvl=load([currentFolder '/../Results_Math_levy_powell_stybtang/VLMOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
%% loading nsga2 results
n=load([currentFolder '/../Results_Math_levy_powell_stybtang/NSGA-II/Scenario-' num2str(Scenario) '/Scenario-' num2str(Scenario) '_Benchmarck-NSGA-II.mat']);
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;
%% loading mopso results 
res=load([currentFolder '/../Results_Math_levy_powell_stybtang/MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;
%% loading m-mopso results
reswm=load([currentFolder '/../Results_Math_levy_powell_stybtang/m-MOPSO/scenario-'   num2str(Scenario) '/scenario-'   num2str(Scenario) '.mat' '/' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontwm=reswm.paretoFront;
paretoSetwm=reswm.paretoSet;
classeswm=reswm.classes;
NCwm=reswm.NC;
popwm=reswm.pop;
