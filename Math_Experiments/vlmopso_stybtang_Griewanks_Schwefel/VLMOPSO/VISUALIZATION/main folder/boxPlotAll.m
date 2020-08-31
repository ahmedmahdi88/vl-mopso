%% initialization and adding paths
clear;close all;
p=pwd;p(p=='\')='/';
addpath([p '/..']);
%%
clc;disp('Delta visualization');
deltaBoxPlot;
%%
clc;disp('set coverage visualization');
setCovBoxPlot;
%%
clc;disp('RGD visualization');
RGDboxplot;
%%
clc;disp('NDS visualization');
NDSboxplot;
%% if you need to visualiz HV uncomment the following 2 lines
% clc;disp('HV visualization');
% HvBoxplot;
%% 
clc;
disp('all done');
%% the end

