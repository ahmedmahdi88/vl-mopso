
% clear;clc;close all;
cd ..;
cd ..;
cd ..;
% cd Results
cd 'Results_Sensors'
% cd 'Results_pop100'

currentFolder = pwd;

Scenario=2;     % select wich scenario you need to visualize
% 
res=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
paretoFront=res.paretoFront;
paretoSet=res.paretoSet;
classes=res.classes;
NC=res.NC;
pop=res.pop;

% lowerLengthvl=resvl.lowerBound_dim;
% higherLengthvl=resvl.higherBound_dim;

cd ..;
cd ..;
% cd 'VLMOPSO/Results'
% cd 'VLMOPSO/Results_fixed_enhancement_time_out'
cd 'VLMOPSO/Results_Sensors'
currentFolder = pwd;
resvl=load([currentFolder '\scenario-'   num2str(Scenario) '\scenario-'   num2str(Scenario) '.mat' '\' 'scenario-'  num2str(Scenario) '.mat']);
% repvl=resvl.rep;
paretoFrontvl=resvl.paretoFront;
paretoSetvl=resvl.paretoSet;
classesvl=resvl.classes;
NCvl=resvl.NC;
% pareto=res.pareto;
% lowerLength=res.lowerBound_dim;
% higherLength=res.higherBound_dim;
nobjArr=[2 2 2 3 2 3 2 3 3 2];
cd ..;
cd ..;

currentFolder=pwd;
path= [currentFolder '\mopso-with-addhock-for-variable-length\VISUALIZATION\Comparison Visualization\Visualization'];
cd(path);


