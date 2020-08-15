
% clear;clc;close all;
% Scenario=10;
cd ..;
cd ..;
cd ..;
nobjArr=2*ones(1,10);
cd 'Results_Sensors_withTime'
currentFolder = pwd;
resvl=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
% env=resvl.env;
cd ..
currentFolder = pwd;
%  cd(['ExperimentSmall\' objfunList{Scenario} '\']);
n=load([currentFolder '\Results_sensors-nsga2\NSGA2\Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '.mat']);
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;
% cd ..;
% cd ..;
 cd ..;
cd 'mopso-with-addhock-for-variable-length/Results_Sensors'
currentFolder = pwd;
res=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;

cd ..;
cd ..;

currentFolder=pwd;
path= [currentFolder '\VLMOPSO\VISUALIZATION\Comparison Visualization\Visualization'];
cd(path);


