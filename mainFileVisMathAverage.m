%% initialization and adding required paths
clear;clc;close all;
currentFolder=pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/visualization main folder']);
%% 
% problems={'WSN','rosen-levy','rosen-rastrigin','rosen-sphere',...
%     'rastrigin-stybtang','weirstrass-stybtang','levy-sty-pow',...
%     'pow-sty-drast','rosen-gri-rast',...
%     'sty-gri-schwefel'};
problems = {'MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3','FonsecaFleming_objfun','TP_ZDT1_objfun',...
    'TP_ZDT2_objfun','TP_ZDT3_objfun','TP_ZDT6_objfun'};

nobjs=[2*ones(1,5) 3*ones(1,4) ,2*ones(1,5)];
%% delta
deltaAverage;
%% nds
ndsAverage;
%% HV
hvAverage;
%% RGD
rgdAverage;
%% setCoverage
setCovAverage;
%% the end