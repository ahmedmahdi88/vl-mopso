%% initialization and adding required paths
clear;clc;close all;
currentFolder=pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/visualization main folder']);
%% set visalization problem number
% you just have to select experiment number then run and all things will be
% done automatically and the figures are saved in results images folder
problemNumber=10;
% problems:
% 1- WSN
% 2- rosen-levy
% 3- rosen-rastrigin
% 4- rosen-sphere
% 5- rastrigin-stybtang
% 6- weirstrass-stybtang
% 7- levy-sty-pow
% 8- pow-sty-drastrigin
% 9- rosen-greiwanks-rastrigin
% 10-stybtang-griewanks-schwefel
problems={'WSN','rosen-levy','rosen-rastrigin','rosen-sphere',...
    'rastrigin-stybtang','weirstrass-stybtang','levy-sty-pow',...
    'pow-sty-drast','rosen-gri-rast',...
    'sty-gri-schwefel'};
nobjs=[2*ones(1,6) 3*ones(1,4)];
%% run bar visualization
AllMeasuresBars;
%% run boxPlot visualization
boxPlotAll;
%% radarGraph 
radarGraph;
%% ttest for set coverage
ttestSetCov
%% sensors environment visualization
if problemNumber==1
    EnvironmentSensorsVis;
end
%% the end