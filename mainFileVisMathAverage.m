%% initialization and adding required paths
clear;clc;close all;
currentFolder=pwd;
currentFolder(currentFolder=='\')='/';
addpath([currentFolder '/visualization codes/visualization main folder']);
%% 
problems={'WSN','rosen-levy','rosen-rastrigin','rosen-sphere',...
    'rastrigin-stybtang','weirstrass-stybtang','levy-sty-pow',...
    'pow-sty-drast','rosen-gri-rast',...
    'sty-gri-schwefel'};
nobjs=[2*ones(1,6) 3*ones(1,4)];
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