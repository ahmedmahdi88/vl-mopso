%% initialization and adding required paths
clear;clc;close all;
currentFolder=pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/visualization main folder']);
%% set visalization problem number
% you just have to select experiment number then run and all things will be
% done automatically and the figures are saved in results images folder
% problems:
problemNumber=1; % for WSN
problems={'WSN','MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3'};

nobjs=[2*ones(1,6) 3*ones(1,4)];
%% run bar visualization
AllMeasuresBars;
%% run boxPlot visualization
boxPlotAll;
%% run boxplot for all mathematical functions
% boxPlotAllInOne;
%% radarGraph 
% radarGraph;
%% ttest for set coverage
% ttestSetCov
%% sensors environment visualization
if problemNumber==1
    EnvironmentSensorsVis;
end
%% the end