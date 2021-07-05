%% initialization and adding required paths
clear;clc;close all;
currentFolder=pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/visualization main folder']);
%% set visalization problem number
% you just have to select experiment number then run and all things will be
% done automatically and the figures are saved in results images folder
%% problems:
% 1- WSN
% 2- MMF14
% 3- MMF15
% 4- MMF14_a
% 5- MMF15_a
% 6- MMF15_l
% 7- MMF15_a_l
% 8- MMF16_l1
% 9- MMF16_l2
% 10- MMF16_l3
% 11- FonsecaFleming_objfun
% 12- TP_ZDT1_objfun
% 13- TP_ZDT2_objfun
% 14- TP_ZDT3_objfun
% 15- TP_ZDT6_objfun
problemNumber=1; 
problems={'WSN','MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3','FonsecaFleming_objfun','TP_ZDT1_objfun',...
    'TP_ZDT2_objfun','TP_ZDT3_objfun','TP_ZDT6_objfun'};
for problemNumber = [1:15]
nobjs=[2*ones(1,6) 3*ones(1,4) 2*ones(1,5)];
%% run bar visualization 
AllMeasuresBars;
%% run boxPlot visualization
boxPlotAll;
%% radarGraph 
radarGraph;
%% ttest for set coverage
ttestSetCov
end
%% sensors environment visualization
if problemNumber==1
    EnvironmentSensorsVis;
end
%% the end