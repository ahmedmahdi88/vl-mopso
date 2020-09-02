
clear;clc;close all;
Scenario=6;
cd ..;
cd ..;
cd ..;
nobjArr=2;
cd 'Results_Sink3'
currentFolder = pwd;
resvl=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;

cd ..
cd ..
cd ..
cd 'mopso-with-addhock-for-variable-length/Results_Sink'
currentFolder = pwd;
res=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;

cd ..;
cd ..;
currentFolder = pwd;
n=load([currentFolder '\NSGA-II-sinkResults_Sink\NSGA II\Scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '_NSGA-II.mat']);
pno=n.paretoFront.solutionsObjectiveValues;
pns=n.paretoFront.solutions;

currentFolder=pwd;
path= [currentFolder '\VLMOPSO-Sink-addedMutation- with results\VLMOPSO\VISUALIZATION\Comparison Visualization\Visualization'];
cd(path);


